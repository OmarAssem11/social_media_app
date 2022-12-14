import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/routes_manager.dart';
import 'package:social_media_app/di/injector.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:social_media_app/features/posts/presentation/widgets/logout_alert.dart';
import 'package:social_media_app/generated/l10n.dart';

class MenuItems extends StatelessWidget {
  const MenuItems();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: Text(S.current.home),
          onTap: () => Navigator.of(context).pop(),
        ),
        ListTile(
          leading: const Icon(Icons.chat_outlined),
          title: Text(S.current.chats),
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.chats),
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: Text(S.current.settings),
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.settings),
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: Text(S.current.logout),
          onTap: () => showDialog(
            context: context,
            builder: (_) => BlocProvider(
              create: (_) => getIt<AuthCubit>(),
              child: const LogoutAlertDialog(),
            ),
          ),
        ),
      ],
    );
  }
}
