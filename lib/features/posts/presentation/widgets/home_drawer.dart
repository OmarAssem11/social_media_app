import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/di/injector.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:social_media_app/features/posts/presentation/widgets/home_drawer_header.dart';
import 'package:social_media_app/features/posts/presentation/widgets/menu_items.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const HomeDrawerHeader(),
          ),
          const MenuItems(),
        ],
      ),
    );
  }
}
