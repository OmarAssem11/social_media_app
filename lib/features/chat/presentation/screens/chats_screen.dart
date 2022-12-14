import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/widgets/error_indicator.dart';
import 'package:social_media_app/core/presentation/widgets/loading_indicator.dart';
import 'package:social_media_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:social_media_app/features/chat/presentation/cubit/chat_state.dart';
import 'package:social_media_app/features/chat/presentation/widgets/chat_item.dart';
import 'package:social_media_app/generated/l10n.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen();

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatCubit>(context).getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.chats),
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return state.maybeWhen(
            getChatsLoading: () => const LoadingIndicator(),
            getChatsError: () => const ErrorIndicator(),
            getChatsSuccess: (chats) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) => ChatItem(chat: chats[index]),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: chats.length,
            ),
            orElse: () => const SizedBox.expand(),
          );
        },
      ),
    );
  }
}
