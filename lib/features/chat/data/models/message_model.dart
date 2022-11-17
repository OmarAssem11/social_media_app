import 'package:json_annotation/json_annotation.dart';
import 'package:social_media_app/core/data/json_converters/date_time_converter.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  @JsonKey(name: 'sender_id')
  final String senderId;
  @JsonKey(name: 'receiver_id')
  final String receiverId;
  final String text;
  @DateTimeConverter()
  @JsonKey(name: 'date_time')
  final DateTime dateTime;

  const MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
