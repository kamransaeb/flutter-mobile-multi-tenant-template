export 'main_dev.dart';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:enterprise_ui/enterprise_ui.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:yorsho_mobile/bootstrap/initialize_app_services.dart';
// import 'package:yorsho_mobile/core/navigation/app_router.dart';
// import 'package:yorsho_mobile/core/theme/theme_bloc.dart';
// import 'package:yorsho_mobile/di/injection.dart';
// import 'package:yorsho_mobile/features/auth/presentation/bloc/auth/auth_bloc.dart';
// import 'package:yorsho_mobile/firebase_options_prod.dart';

// Future<void> main() async {
//   // in main(), before runApp:
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//   await configureDependencies();
//   await initializeAppServices();

//   runApp(
//     EasyLocalization(
//       supportedLocales: const [Locale('en'), Locale('tr')],
//       path: 'assets/translations',
//       fallbackLocale: const Locale('en'),
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider.value(value: getIt<ThemeBloc>()),
//           BlocProvider.value(
//             value: getIt<AuthBloc>()
//               ..add(const AuthEvent.checkStatusRequested()),
//           ),
//         ],
//         child: const YorshoApp(),
//       ),
//     ),
//   );
// }

// /// Main app widget
// class YorshoApp extends StatelessWidget {
//   /// Constructor
//   const YorshoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appRouter = getIt<AppRouter>();

//     return BlocBuilder<ThemeBloc, ThemeState>(
//       builder: (context, themeState) {
//         return BlocBuilder<AuthBloc, AuthState>(
//           builder: (context, authState) {
//             return MaterialApp.router(
//               title: 'Yorsho',
//               theme: AppTheme.light(seed: Colors.teal),
//               darkTheme: AppTheme.dark(seed: Colors.teal),
//               themeMode: themeState.currentThemeStatus.themeMode,
//               localizationsDelegates: context.localizationDelegates,
//               supportedLocales: context.supportedLocales,
//               locale: context.locale,
//               routerConfig: appRouter.config(),
//               builder: (context, child) {
//                 if (authState.isChecking) {
//                   return const Scaffold(
//                     body: Center(child: AppLoadingIndicator()),
//                   );
//                 }
//                 return child ?? const SizedBox.shrink();
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
