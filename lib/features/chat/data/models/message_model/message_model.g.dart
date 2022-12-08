// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      senderId: json['sender_id'] as String,
      receiverId: json['receiver_id'] as String,
      text: json['text'] as String,
      dateTime: const DateTimeConverter().fromJson(json['date_time'] as int),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'receiver_id': instance.receiverId,
      'text': instance.text,
      'date_time': const DateTimeConverter().toJson(instance.dateTime),
    };
