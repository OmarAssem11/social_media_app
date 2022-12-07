import 'package:social_media_app/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<void> sendMessage();

  Future<List<MessageModel>> getMessages();
}
