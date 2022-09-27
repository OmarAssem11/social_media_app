import 'package:flutter/material.dart';
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
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.chat_outlined),
          title: Text(S.current.chats),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: Text(S.current.settings),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: Text(S.current.logout),
          onTap: () {},
        ),
      ],
    );
  }
}
