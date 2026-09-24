import 'package:freezed_annotation/freezed_annotation.dart';

/// User Yorsho account type
enum UserYorshoAccountType {
  /// Admin
  @JsonValue(0)
  admin,

  /// User
  @JsonValue(1)
  user,
}
