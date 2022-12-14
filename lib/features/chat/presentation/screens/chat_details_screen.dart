import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/presentation/resources/values_manager.dart';
import 'package:social_media_app/core/presentation/widgets/error_indicator.dart';
import 'package:social_media_app/core/presentation/widgets/loading_indicator.dart';
import 'package:social_media_app/features/chat/domain/entities/chat/chat.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';
import 'package:social_media_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:social_media_app/features/chat/presentation/cubit/chat_state.dart';
import 'package:social_media_app/features/chat/presentation/widgets/chat_message.dart';
import 'package:social_media_app/generated/l10n.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen();

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final messageController = TextEditingController();
  late final ChatCubit chatCubit;
  late final Chat chat;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chatCubit = BlocProvider.of<ChatCubit>(context);
    chat = ModalRoute.of(context)!.settings.arguments! as Chat;
    chatCubit.getMessages(receiverId: chat.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: Sizes.s20,
              backgroundImage: NetworkImage(chat.imageUrl),
            ),
            const SizedBox(width: Sizes.s16),
            Text(chat.name),
          ],
        ),
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return state.maybeWhen(
            getMessagesLoading: () => const LoadingIndicator(),
            getMessagesError: () => const ErrorIndicator(),
            getMessagesSuccess: (messages) => Padding(
              padding: const EdgeInsets.all(Insets.l),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (_, index) => ChatMessage(messages[index]),
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: Sizes.s16),
                      itemCount: messages.length,
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(Sizes.s16),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: Sizes.s12),
                        Expanded(
                          child: TextFormField(
                            controller: messageController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: S.current.typeYourMessageHere,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.blue,
                          child: MaterialButton(
                            onPressed: () {
                              chatCubit.sendMessage(
                                Message(
                                  text: messageController.text,
                                  dateTime: DateTime.now(),
                                  receiverId: chat.id,
                                ),
                              );
                              messageController.clear();
                            },
                            minWidth: 1,
                            child: const Icon(
                              Icons.send,
                              size: Sizes.s16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            orElse: () => const SizedBox.expand(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
