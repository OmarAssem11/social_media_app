import 'package:flutter/material.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(this.message);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget buildMessage(Message message) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(Sizes.s12),
            topStart: Radius.circular(Sizes.s12),
            topEnd: Radius.circular(Sizes.s12),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Insets.xs,
          horizontal: Insets.s,
        ),
        child: Text(message.text),
      ),
    );

Widget buildMyMessage(Message message) => Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.3),
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(Sizes.s12),
            topStart: Radius.circular(Sizes.s12),
            topEnd: Radius.circular(Sizes.s12),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Insets.xs,
          horizontal: Insets.s,
        ),
        child: Text(message.text),
      ),
    );
