/// User yorsho endpoints.
abstract final class UserYorshoEndpoints {
  /// User Yorsho
  static const String getOrCreateUserYorshoOpenMobile =
      '/open/mobile/user-yorsho/get-or-create';

  /// User Yorsho Mobile Client
  static const String getUserYorshoMobileClient =
      '/mobile/client/user-yorsho';

  /// User Yorsho Mobile Client Complete
  static const String completeUserYorshoMobileClient =
      '/mobile/client/user-yorsho/complete';

  /// User Yorsho Mobile Client Update
  static const String updateUserYorshoMobileClient =
      '/mobile/client/user-yorsho';

  /// Videos List Enabled By Videos Category Id List Mobile Client
  static const String getVideosListEnabledByVideosCategoryIdListMobileClient =
      '/mobile/client/videos/enabled/videos-category-id-list';

  /// Videos Category List Enabled Mobile Client
  static const String getVideosCategoryListEnabledMobileClient =
      '/mobile/client/videos-category/enabled';
}
