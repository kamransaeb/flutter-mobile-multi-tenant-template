import 'package:yorsho_mobile/features/profile/data/models/user_yorsho_model.dart';

/// Remote data source for user yorsho.
abstract class UserYorshoRemoteDataSource {
  /// Get or create user yorsho open mobile.
  Future<UserYorshoModel> getOrCreateUserYorshoOpenMobile();

  /// Get user yorsho mobile client.
  Future<UserYorshoModel> getUserYorshoMobileClient();

  /// Update user yorsho mobile client.
  Future<UserYorshoModel> updateUserYorshoMobileClient(
    UserYorshoModel userYorshoModel,
  );

  /// Complete user yorsho mobile client.
  Future<UserYorshoModel> completeUserYorshoMobileClient(
    UserYorshoModel userYorshoModel,
  );
}
