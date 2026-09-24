import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yorsho_mobile/features/profile/data/datasources/user_yorsho_remote_data_source.dart';
import 'package:yorsho_mobile/features/profile/domain/entities/user_yorsho.dart';
import 'package:yorsho_mobile/features/profile/domain/repositories/user_yorsho_repository.dart';

/// Implementation of the UserYorshoRepository interface
@Injectable(as: UserYorshoRepository)
class UserYorshoRepositoryImpl implements UserYorshoRepository {
  /// Constructor.
  UserYorshoRepositoryImpl(
    this._userYorshoRemoteDataSource,
    this._errorHandler,
  );

  final UserYorshoRemoteDataSource _userYorshoRemoteDataSource;
  final ErrorHandler _errorHandler;

  /// Get a post by ID.
  @override
  Future<Either<Failure, UserYorsho>>
  getOrCreateUserYorshoOpenMobile() async {
    try {
      final response = await _userYorshoRemoteDataSource
          .getOrCreateUserYorshoOpenMobile();
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getOrCreateUserYorshoOpenMobile',
        ),
      );
    }
  }

  /// Complete user yorsho mobile client.
  @override
  Future<Either<Failure, UserYorsho>>
  completeUserYorshoMobileClient(
    UserYorsho userYorsho,
  ) async {
    try {
      final response = await _userYorshoRemoteDataSource
          .completeUserYorshoMobileClient(
            userYorsho.toModel(),
          );
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'completeUserYorshoMobileClient',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserYorsho>> updateUserYorshoMobileClient(
    UserYorsho userYorsho,
  ) async {
    try {
      final response = await _userYorshoRemoteDataSource
          .updateUserYorshoMobileClient(
            userYorsho.toModel(),
          );
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'updateUserYorshoMobileClient',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserYorsho>>
  getUserYorshoMobileClient() async {
    try {
      final response = await _userYorshoRemoteDataSource
          .getUserYorshoMobileClient();
      return Right(response.toEntity());
    } on Object catch (e, stackTrace) {
      return Left(
        _errorHandler.handleError(
          e,
          stackTrace: stackTrace,
          reason: 'getUserYorsho',
        ),
      );
    }
  }
}
