import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/di/injector.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:social_media_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/login_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/register_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/starter_screen.dart';
import 'package:social_media_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:social_media_app/generated/l10n.dart';

class AppRoutes {
  static const String starter = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.starter:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const StarterScreen(),
        ),
      );
    case AppRoutes.onboarding:
      return MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      );
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const LoginScreen(),
        ),
      );
    case AppRoutes.register:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const RegisterScreen(),
        ),
      );
    case AppRoutes.forgotPassword:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const ForgotPasswordScreen(),
        ),
      );
    default:
      return undefinedRoute();
  }
}

Route<dynamic> undefinedRoute() => MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.noPageFound),
        ),
      ),
    );
