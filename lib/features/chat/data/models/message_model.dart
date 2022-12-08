import 'package:json_annotation/json_annotation.dart';
import 'package:social_media_app/core/data/constants/key_constants.dart';
import 'package:social_media_app/core/data/json_converters/date_time_converter.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  @JsonKey(name: KeyConstants.senderId)
  final String senderId;
  @JsonKey(name: KeyConstants.receiverId)
  final String receiverId;
  final String text;
  @DateTimeConverter()
  @JsonKey(name: KeyConstants.dateTime)
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
