import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/color_manager.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage(this.message);

  final Message message;

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  late bool isMyMessage;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          currentUser: (currentUser) {
            isMyMessage = currentUser.id == widget.message.senderId;
            return isMyMessage
                ? buildMyMessage(widget.message)
                : buildMessage(widget.message);
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

Widget buildMessage(Message message) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorManager.grey300,
          borderRadius: BorderRadiusDirectional.only(
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
        decoration: const BoxDecoration(
          color: ColorManager.lightBlueWithOpacity,
          borderRadius: BorderRadiusDirectional.only(
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
