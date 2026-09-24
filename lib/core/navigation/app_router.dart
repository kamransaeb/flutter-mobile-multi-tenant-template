import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yorsho_mobile/core/navigation/route_guards.dart';
import 'package:yorsho_mobile/features/app_director/presentation/pages/app_director_page.dart';
import 'package:yorsho_mobile/features/login/presentation/pages/login_page.dart';
import 'package:yorsho_mobile/features/posts/presentation/pages/posts_demo_page.dart';
import 'package:yorsho_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:yorsho_mobile/features/reset_password/presentation/pages/reset_password_page.dart';
import 'package:yorsho_mobile/features/sign_up/presentation/pages/sign_up_page.dart';

part 'app_router.gr.dart';

/// [AppRouter] is the main router for the app.
@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Unguarded bootstrap: AppData + auth decision live on this page.
    AutoRoute(
      page: AppDirectorRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
      guards: const [AuthGuard(requiresAuth: false)],
    ),
    AutoRoute(
      page: SignUpRoute.page,
      path: '/sign-up',
      guards: const [AuthGuard(requiresAuth: false)],
    ),
    AutoRoute(
      page: ResetPasswordRoute.page,
      path: '/reset-password',
      guards: const [AuthGuard(requiresAuth: false)],
    ),
    AutoRoute(
      page: ProfileRoute.page,
      path: '/profile',
      guards: const [AuthGuard()],
    ),
  ];
}
