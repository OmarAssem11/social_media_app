import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/strings_manager.dart';
import 'package:social_media_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/login_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/register_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/starter_screen.dart';

class AppRoutes {
  static const starter = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgotPassword';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.starter:
      return MaterialPageRoute(
        builder: (_) => const StarterScreen(),
      );
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case AppRoutes.register:
      return MaterialPageRoute(
        builder: (_) => const RegisterScreen(),
      );
    case AppRoutes.forgotPassword:
      return MaterialPageRoute(
        builder: (_) => const ForgotPasswordScreen(),
      );
    default:
      return undefinedRoute();
  }
}

Route<dynamic> undefinedRoute() => MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
      ),
    );
