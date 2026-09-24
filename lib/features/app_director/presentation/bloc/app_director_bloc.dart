import 'dart:io';

import 'package:enterprise_core/enterprise_core.dart';
import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:enterprise_storage/enterprise_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yorsho_mobile/core/constants/di_constants.dart';
import 'package:yorsho_mobile/core/constants/storage_constants.dart';
import 'package:yorsho_mobile/core/utils/app_version_comparator.dart';
import 'package:yorsho_mobile/features/app/domain/entities/app_data.dart';
import 'package:yorsho_mobile/features/app/domain/usecases/get_app_data_use_case.dart';
import 'package:yorsho_mobile/features/app_director/domain/usecases/get_or_create_user_yorsho_open_mobile_use_case.dart';
import 'package:yorsho_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:yorsho_mobile/features/profile/domain/entities/user_yorsho.dart';

part 'app_director_bloc.freezed.dart';
part 'app_director_event.dart';
part 'app_director_state.dart';

/// Owns bootstrap: AppData / force-update, auth, open-mobile profile.
@lazySingleton
class AppDirectorBloc extends Bloc<AppDirectorEvent, AppDirectorState> {
  /// Creates an [AppDirectorBloc].
  AppDirectorBloc(
    this._logger,
    this._authBloc,
    this._getAppDataUseCase,
    this._getOrCreateUserYorshoOpenMobileUseCase,
    @Named(DiConstants.sharedPrefs) this._prefs,
  ) : super(const AppDirectorState.initial()) {
    on<_EventLoaded>(_onLoaded);
    on<_EventFirstUseDisabled>(_onFirstUseDisabled);
  }

  final LoggerService _logger;
  final AuthBloc _authBloc;
  final GetAppDataUseCase _getAppDataUseCase;
  final GetOrCreateUserYorshoOpenMobileUseCase
  _getOrCreateUserYorshoOpenMobileUseCase;
  final LocalStorage _prefs;

  Future<void> _onLoaded(
    _EventLoaded event,
    Emitter<AppDirectorState> emit,
  ) async {
    // Ignore while in-flight or already decided (page rebuilds / remounts).
    if (state.isLoading || state.isUpdateRequired || state.isSuccess) return;

    emit(
      AppDirectorState.loading(
        isFirstUse: state.isFirstUse,
        isAppUpdate: state.isAppUpdate,
        storeUrlEn: state.storeUrlEn,
        storeUrlTr: state.storeUrlTr,
      ),
    );

    final appDataResult = await _loadAppData(emit);
    if (appDataResult == null) return;

    final (isFirstUse, appData, isAppUpdateOk) = appDataResult;
    if (!isAppUpdateOk) {
      emit(
        AppDirectorState.updateRequired(
          isFirstUse: isFirstUse,
          storeUrlEn: appData.storeUrlEn,
          storeUrlTr: appData.storeUrlTr,
        ),
      );
      return;
    }

    _logger.d('Checking auth status');
    _authBloc.add(const AuthEvent.checkStatusRequested());
    final authState = await _authBloc.stream.firstWhere(
      (s) => !s.isChecking && s.hasAuthDecision,
    );
    _logger.d('Auth status: ${authState.isAuthenticated}');
    if (!authState.isAuthenticated) {
      _logger.d('Open-mobile skipped: user is not authenticated');
      emit(
        AppDirectorState.failure(
          failure: const UnauthorizedAccessFailure(
            message: 'user_not_authenticated',
          ),
          isFirstUse: isFirstUse,
          storeUrlEn: appData.storeUrlEn,
          storeUrlTr: appData.storeUrlTr,
        ),
      );
      return;
    }

    _logger.d('Getting or creating user yorsho open mobile');
    final result = await _getOrCreateUserYorshoOpenMobileUseCase(
      const NoParams(),
    );
    result.fold(
      (failure) {
        emit(
          AppDirectorState.failure(
            failure: failure,
            isFirstUse: isFirstUse,
            storeUrlEn: appData.storeUrlEn,
            storeUrlTr: appData.storeUrlTr,
          ),
        );
        _logger.d(
          'Getting or creating user yorsho open mobile failed',
        );
      },
      (userYorsho) {
        if (userYorsho.forceLogout) {
          _authBloc.add(const AuthEvent.logoutRequested());
          emit(
            AppDirectorState.failure(
              failure: const UnauthorizedAccessFailure(
                message: 'user_not_authenticated',
              ),
              isFirstUse: isFirstUse,
              storeUrlEn: appData.storeUrlEn,
              storeUrlTr: appData.storeUrlTr,
            ),
          );
          return;
        }
        emit(
          AppDirectorState.success(
            userYorsho: userYorsho,
            isFirstUse: isFirstUse,
            storeUrlEn: appData.storeUrlEn,
            storeUrlTr: appData.storeUrlTr,
          ),
        );
        _logger.d(
          'Getting or creating user yorsho open mobile success',
        );
      },
    );
  }

  /// Loads AppData; returns null if a failure state was already emitted.
  Future<(bool isFirstUse, AppData appData, bool isAppUpdateOk)?> _loadAppData(
    Emitter<AppDirectorState> emit,
  ) async {
    try {
      final isFirstUse =
          await _prefs.read<bool>(StorageConstants.isFirstLaunch) ?? true;
      final appDataId = Platform.isIOS ? 1 : 2;
      _logger.d('AppDirector loading appDataId=$appDataId');

      final result = await _getAppDataUseCase(
        GetAppDataParams(appDataId: appDataId),
      );

      return await result.fold<Future<(bool, AppData, bool)?>>(
        (failure) async {
          _logger.e('AppDirector getAppData failed', error: failure);
          emit(
            AppDirectorState.failure(
              failure: failure,
              isFirstUse: isFirstUse,
              storeUrlEn: state.storeUrlEn,
              storeUrlTr: state.storeUrlTr,
            ),
          );
          return null;
        },
        (appData) async {
          await _persistAppData(appData);
          final packageInfo = await PackageInfo.fromPlatform();
          final isOutdated = AppVersionComparator.isLocalOutdated(
            localVersion: packageInfo.version,
            localBuild: packageInfo.buildNumber,
            remoteVersion: appData.appVersion,
            remoteBuild: appData.buildNumber,
          );
          final forceUpdate = appData.forceUpdate ?? false;
          // Block only when behind remote min version/build and force-update.
          final isAppUpdateOk = !isOutdated || !forceUpdate;
          await _prefs.write(StorageConstants.isAppUpdateOk, isAppUpdateOk);
          _logger.d(
            'AppDirector appData ok '
            'local=${packageInfo.version}+${packageInfo.buildNumber} '
            'remote=${appData.appVersion}+${appData.buildNumber} '
            'isOutdated=$isOutdated forceUpdate=$forceUpdate '
            'isAppUpdateOk=$isAppUpdateOk',
          );
          return (isFirstUse, appData, isAppUpdateOk);
        },
      );
    } on Object catch (error, stackTrace) {
      _logger.e(
        'AppDirector loadAppData failed',
        error: error,
        stackTrace: stackTrace,
      );
      emit(
        AppDirectorState.failure(
          failure: UnknownFailure(
            message: 'app_data_load_failed',
            details: {'error': error.toString()},
          ),
          isFirstUse: state.isFirstUse,
          storeUrlEn: state.storeUrlEn,
          storeUrlTr: state.storeUrlTr,
        ),
      );
      return null;
    }
  }

  Future<void> _persistAppData(AppData appData) async {
    await Future.wait([
      _prefs.write(StorageConstants.remoteAppVersion, appData.appVersion),
      _prefs.write(StorageConstants.remoteBuildNumber, appData.buildNumber),
      _prefs.write(StorageConstants.storeUrlEn, appData.storeUrlEn),
      _prefs.write(StorageConstants.storeUrlTr, appData.storeUrlTr),
    ]);
  }

  Future<void> _onFirstUseDisabled(
    _EventFirstUseDisabled event,
    Emitter<AppDirectorState> emit,
  ) async {
    if (!state.isFirstUse) return;

    await _prefs.write(StorageConstants.isFirstLaunch, false);
    emit(
      state.maybeMap(
        success: (s) => s.copyWith(isFirstUse: false),
        loading: (s) => s.copyWith(isFirstUse: false),
        failure: (s) => s.copyWith(isFirstUse: false),
        initial: (s) => s.copyWith(isFirstUse: false),
        updateRequired: (s) => s.copyWith(isFirstUse: false),
        orElse: () => state,
      ),
    );
  }
}
