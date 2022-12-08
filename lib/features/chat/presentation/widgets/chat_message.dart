import 'package:flutter/material.dart';
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
            bottomEnd: Radius.circular(10),
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
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
            bottomStart: Radius.circular(10),
            topStart: Radius.circular(10),
            topEnd: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(message.text),
      ),
    );
