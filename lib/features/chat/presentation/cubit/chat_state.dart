import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_media_app/features/chat/domain/entities/chat/chat.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = ChatInitial;

  const factory ChatState.getChatsLoading() = GetChatsLoading;
  const factory ChatState.getChatsSuccess(final List<Chat> chats) =
      GetChatsSuccess;
  const factory ChatState.getChatsError() = GetChatsError;

  const factory ChatState.sendMessageLoading() = SendMessageLoading;
  const factory ChatState.sendMessageSuccess() = SendMessageSuccess;
  const factory ChatState.sendMessageError() = SendMessageError;

  const factory ChatState.getMessagesLoading() = GetMessagesLoading;
  const factory ChatState.getMessagesSuccess(final List<Message> messages) =
      GetMessagesSuccess;
  const factory ChatState.getMessagesError() = GetMessagesError;
}
