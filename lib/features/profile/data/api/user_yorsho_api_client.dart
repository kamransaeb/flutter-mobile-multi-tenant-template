// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers, needed in .g.dart file.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yorsho_mobile/features/posts/data/models/post_model.dart';
import 'package:yorsho_mobile/features/profile/data/api/user_yorsho_endpoints.dart';
import 'package:yorsho_mobile/features/profile/data/models/user_yorsho_model.dart';

part 'user_yorsho_api_client.g.dart';

/// User Yorsho API client.
@lazySingleton
@RestApi()
abstract class UserYorshoApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory UserYorshoApiClient(DioClient dioClient) =>
      _UserYorshoApiClient(dioClient.dio);

  /// Get or create open-mobile profile (requires Firebase id token).
  @GET(UserYorshoEndpoints.getOrCreateUserYorshoOpenMobile)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserYorshoModel>>
  getOrCreateUserYorshoOpenMobile();

  /// Get mobile client profile (requires Firebase id token).
  @GET(UserYorshoEndpoints.getUserYorshoMobileClient)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<UserYorshoModel>> getUserYorshoMobileClient();

  /// Get all posts
  @GET(UserYorshoEndpoints.getUserYorshoMobileClient)
  @Extra({NetworkConstants.skipAuthExtraKey: true})
  Future<HttpResponse<List<PostModel>>> getPosts({
    @Query('limit') int? limit = 5,
  });

  /// Update user yorsho mobile client
  @PUT(UserYorshoEndpoints.updateUserYorshoMobileClient)
  Future<HttpResponse<UserYorshoModel>>
  updateUserYorshoMobileClient({
    @Body() required UserYorshoModel userYorshoModel,
  });

  /// Complete user yorsho mobile client
  @PUT(UserYorshoEndpoints.completeUserYorshoMobileClient)
  Future<HttpResponse<UserYorshoModel>>
  completeUserYorshoMobileClient({
    @Body() required UserYorshoModel userYorshoModel,
  });
}
