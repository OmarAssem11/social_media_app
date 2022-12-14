import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/return_app_exception.dart';
import 'package:social_media_app/features/chat/data/datasources/remote_datasource/chat_remote_datasource.dart';
import 'package:social_media_app/features/chat/data/models/chat_model/chat_model.dart';
import 'package:social_media_app/features/chat/data/models/message_model/message_model.dart';
import 'package:social_media_app/features/chat/data/services/chat_firebase_service.dart';

@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ChatFirebaseService _chatFirebaseService;

  const ChatRemoteDataSourceImpl(this._chatFirebaseService);

  @override
  Future<List<ChatModel>> getChats() {
    try {
      return _chatFirebaseService.getChats();
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<void> sendMessage(MessageModel messageModel) {
    try {
      return _chatFirebaseService.sendMessage(messageModel);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<List<MessageModel>> getMessages(String receiverId) {
    try {
      return _chatFirebaseService.getMessages(receiverId: receiverId);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }
}
