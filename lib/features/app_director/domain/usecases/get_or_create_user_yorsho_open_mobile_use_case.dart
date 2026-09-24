import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enterprise_core/enterprise_core.dart';
import 'package:injectable/injectable.dart';
import 'package:yorsho_mobile/features/profile/domain/entities/user_yorsho.dart';
import 'package:yorsho_mobile/features/profile/domain/repositories/user_yorsho_repository.dart';

/// Use case to get or create a user yorsho open mobile.
@injectable
class GetOrCreateUserYorshoOpenMobileUseCase
    implements BaseUseCase<UserYorsho, NoParams> {
  /// Constructor
  const GetOrCreateUserYorshoOpenMobileUseCase(
    this._userYorshoRepository,
  );

  final UserYorshoRepository _userYorshoRepository;

  @override
  Future<Either<Failure, UserYorsho>> call(NoParams params) async {
    return _userYorshoRepository.getOrCreateUserYorshoOpenMobile();
  }
}
