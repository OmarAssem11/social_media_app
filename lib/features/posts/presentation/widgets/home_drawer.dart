import 'package:flutter/material.dart';
import 'package:social_media_app/features/posts/presentation/widgets/home_drawer_header.dart';
import 'package:social_media_app/features/posts/presentation/widgets/menu_items.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          HomeDrawerHeader(),
          MenuItems(),
        ],
      ),
    );
  }
}
