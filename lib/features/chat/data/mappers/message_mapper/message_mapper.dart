import 'package:social_media_app/features/chat/data/models/message_model/message_model.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';

extension MessageMapper on Message {
  MessageModel get toModel => MessageModel(
        senderId: '',
        receiverId: '',
        text: text,
        dateTime: dateTime,
      );
}
