import 'package:social_media_app/features/chat/data/models/chat_model/chat_model.dart';
import 'package:social_media_app/features/chat/data/models/message_model/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatModel>> getChats();

  Future<void> sendMessage(MessageModel messageModel);

  Future<List<MessageModel>> getMessages(String receiverId);
}
