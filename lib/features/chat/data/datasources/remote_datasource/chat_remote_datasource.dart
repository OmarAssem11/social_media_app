import 'package:social_media_app/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<void> sendMessage(MessageModel messageModel);

  Future<List<MessageModel>> getMessages();
}
