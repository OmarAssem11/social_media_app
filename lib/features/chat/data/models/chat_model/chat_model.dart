import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  final String id;
  final String name;
  final String imageUrl;

  const ChatModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
