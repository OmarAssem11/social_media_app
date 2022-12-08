import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/routes_manager.dart';
import 'package:social_media_app/features/chat/domain/entities/chat/chat.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.chatDetails),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                chat.imageUrl,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              chat.name,
              style: const TextStyle(
                height: 1.3,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
