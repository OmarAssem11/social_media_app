import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/di/injector.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:social_media_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/login_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/register_screen.dart';
import 'package:social_media_app/features/auth/presentation/screens/starter_screen.dart';
import 'package:social_media_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:social_media_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:social_media_app/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:social_media_app/features/posts/presentation/screens/add_post_screen.dart';
import 'package:social_media_app/features/posts/presentation/screens/home_screen.dart';
import 'package:social_media_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:social_media_app/generated/l10n.dart';

class AppRoutes {
  static const String starter = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot_password';
  static const String home = '/home';
  static const String addPost = '/add_post';
  static const String settings = '/settings';
  static const String chat = '/chat';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.starter:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const StarterScreen(),
        ),
      );
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const LoginScreen(),
        ),
      );
    case AppRoutes.register:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const RegisterScreen(),
        ),
      );
    case AppRoutes.forgotPassword:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const ForgotPasswordScreen(),
        ),
      );
    case AppRoutes.home:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<PostsCubit>(),
          child: const HomeScreen(),
        ),
      );
    case AppRoutes.addPost:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<PostsCubit>(),
          child: const AddPostScreen(),
        ),
      );
    case AppRoutes.settings:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<PostsCubit>(),
          child: const SettingsScreen(),
        ),
      );
    case AppRoutes.chat:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<ChatCubit>(),
          child: const ChatScreen(),
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
