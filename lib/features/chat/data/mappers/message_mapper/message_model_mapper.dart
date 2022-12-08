import 'package:social_media_app/features/chat/data/models/message_model/message_model.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';

extension MessageModelMapper on MessageModel {
  Message get fromModel => Message(
        senderId: senderId,
        receiverId: receiverId,
        text: text,
        dateTime: dateTime,
      );
}
