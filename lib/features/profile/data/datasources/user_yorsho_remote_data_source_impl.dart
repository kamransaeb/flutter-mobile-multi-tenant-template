import 'package:enterprise_logger/enterprise_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:yorsho_mobile/features/profile/data/api/user_yorsho_api_client.dart';
import 'package:yorsho_mobile/features/profile/data/datasources/user_yorsho_remote_data_source.dart';
import 'package:yorsho_mobile/features/profile/data/models/user_yorsho_model.dart';

/// Remote data source implementation for user yorsho.
@Injectable(as: UserYorshoRemoteDataSource)
class UserYorshoRemoteDataSourceImpl
    implements UserYorshoRemoteDataSource {
  /// Injectable constructor for PostsRemoteDataSourceImpl
  UserYorshoRemoteDataSourceImpl(this._logger, this._apiClient);
  final LoggerService _logger;
  final UserYorshoApiClient _apiClient;

  @override
  Future<UserYorshoModel> getOrCreateUserYorshoOpenMobile() async {
    final resposne = await _apiClient.getOrCreateUserYorshoOpenMobile();
    return resposne.data;
  }

  @override
  Future<UserYorshoModel> updateUserYorshoMobileClient(
    UserYorshoModel userYorshoModel,
  ) async {
    final resposne = await _apiClient.updateUserYorshoMobileClient(
      userYorshoModel: userYorshoModel,
    );
    return resposne.data;
  }

  @override
  Future<UserYorshoModel> completeUserYorshoMobileClient(
    UserYorshoModel userYorshoModel,
  ) async {
    final resposne = await _apiClient.completeUserYorshoMobileClient(
      userYorshoModel: userYorshoModel,
    );
    return resposne.data;
  }

  @override
  Future<UserYorshoModel> getUserYorshoMobileClient() async {
    final resposne = await _apiClient.getUserYorshoMobileClient();
    return resposne.data;
  }
}
