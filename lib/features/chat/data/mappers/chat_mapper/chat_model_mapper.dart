import 'package:social_media_app/features/chat/data/models/chat_model/chat_model.dart';
import 'package:social_media_app/features/chat/domain/entities/chat/chat.dart';

extension ChatModelMapper on ChatModel {
  Chat get fromModel => Chat(
        id: id,
        name: name,
        imageUrl: imageUrl,
      );
}
