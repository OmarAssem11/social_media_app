import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';
import 'package:social_media_app/features/chat/domain/usecases/get_chats_usecase.dart';
import 'package:social_media_app/features/chat/domain/usecases/get_messages_usecase.dart';
import 'package:social_media_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:social_media_app/features/chat/presentation/cubit/chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._getChatsUseCase,
    this._sendMessageUseCase,
    this._getMessagesUseCase,
  ) : super(const ChatInitial());

  final GetChatsUseCase _getChatsUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetMessagesUseCase _getMessagesUseCase;

  Future<void> getChats() async {
    emit(const GetChatsLoading());
    final result = await _getChatsUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const GetChatsError(),
        (chats) => GetChatsSuccess(chats),
      ),
    );
  }

  Future<void> sendMessage(Message message) async {
    emit(const SendMessageLoading());
    final result = await _sendMessageUseCase(
      SendMessageParams(message: message),
    );
    emit(
      result.fold(
        (failure) => const SendMessageError(),
        (_) => const SendMessageSuccess(),
      ),
    );
  }

  Future<void> getMessages({
    required String receiverId,
  }) async {
    emit(const GetMessagesLoading());
    final result =
        await _getMessagesUseCase(GetMessagesParams(receiverId: receiverId));
    emit(
      result.fold(
        (failure) => const GetMessagesError(),
        (messages) => GetMessagesSuccess(messages),
      ),
    );
  }
}
