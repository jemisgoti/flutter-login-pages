import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_pages/src/features/authentication/presentation/pages/login.dart';
import 'package:flutter_login_pages/src/features/authentication/presentation/pages/login_page2.dart';
import 'package:flutter_login_pages/src/features/authentication/presentation/pages/splash_sreen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/login-01',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/login-02',
        builder: (context, state) => const LoginPage2(),
      ),
    ],
  );

  static void go(String path) {
    navigatorKey.currentContext!.go(path);
  }
}

class AppRoutes {
  static String splashScreen = '/splash-screen';
  static String login = '/login';
  static String login1 = '/login-01';
  static String login2 = '/login-02';
}
