// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AppDirectorPage]
class AppDirectorRoute extends PageRouteInfo<void> {
  const AppDirectorRoute({List<PageRouteInfo>? children})
    : super(AppDirectorRoute.name, initialChildren: children);

  static const String name = 'AppDirectorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppDirectorPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    void Function({bool? success})? onResult,
    String? email,
    String? password,
    List<PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(
           key: key,
           onResult: onResult,
           email: email,
           password: password,
         ),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginPage(
        key: args.key,
        onResult: args.onResult,
        email: args.email,
        password: args.password,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onResult, this.email, this.password});

  final Key? key;

  final void Function({bool? success})? onResult;

  final String? email;

  final String? password;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult, email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode ^ password.hashCode;
}

/// generated route for
/// [PostsDemoPage]
class PostsDemoRoute extends PageRouteInfo<void> {
  const PostsDemoRoute({List<PageRouteInfo>? children})
    : super(PostsDemoRoute.name, initialChildren: children);

  static const String name = 'PostsDemoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PostsDemoPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
    : super(ResetPasswordRoute.name, initialChildren: children);

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordPage();
    },
  );
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpPage();
    },
  );
}
