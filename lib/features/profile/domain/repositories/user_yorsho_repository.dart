import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:yorsho_mobile/features/profile/domain/entities/user_yorsho.dart';

/// Repository for user yorsho.
abstract class UserYorshoRepository {
  /// Get or create user yorsho open mobile.
  Future<Either<Failure, UserYorsho>>
  getOrCreateUserYorshoOpenMobile();

  /// Complete user yorsho mobile client.
  Future<Either<Failure, UserYorsho>>
  completeUserYorshoMobileClient(
    UserYorsho userYorsho,
  );

  /// Update user yorsho mobile client.
  Future<Either<Failure, UserYorsho>> updateUserYorshoMobileClient(
    UserYorsho userYorsho,
  );

  /// Get user yorsho.
  Future<Either<Failure, UserYorsho>> getUserYorshoMobileClient();
}
