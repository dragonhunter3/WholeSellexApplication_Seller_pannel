import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/pages/forget.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/pages/login.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/pages/sign_up_auth.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/auth/pages/sign_up_page.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/dashboard_drawer/pages/dashboard_screen.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/notifications/pages/notification.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/screen/product_screen.dart';
import 'package:whole_sellex_selleradmin_pannel/src/routes/error_route.dart';
import 'route_transition.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.loginpage}',
    routes: [
      GoRoute(
        name: AppRoute.errorPage,
        path: '/${AppRoute.errorPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ErrorPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.dashboard,
        path: '/${AppRoute.dashboard}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DashboardPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.product,
        path: '/${AppRoute.product}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: ProductFormScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.notificationpage,
        path: '/${AppRoute.notificationpage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: NotificationScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.signup,
        path: '/${AppRoute.signup}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.loginpage,
        path: '/${AppRoute.loginpage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.signauth,
        path: '/${AppRoute.signauth}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: SignUpAthenticate(),
        ),
      ),
      GoRoute(
        name: AppRoute.forget,
        path: '/${AppRoute.forget}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: ForgotPasswordScreen(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';
  static const String dashboard = "dashboard-screen";
  static const String product = "product-screen";
  static const String notificationpage = "notification";
  static const String signup = "sign-up-page";
  static const String signauth = "sign-up-auth";
  static const String loginpage = "login";
  static const String forget = "forget";
}
