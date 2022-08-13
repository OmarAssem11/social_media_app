import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final String id;
  final String text;
  final String imageUrl;
  @TimestampConverter()
  final DateTime dateTime;
  final String publisherName;
  final String publisherImage;

  const PostModel({
    required this.id,
    required this.text,
    required this.imageUrl,
    required this.dateTime,
    required this.publisherName,
    required this.publisherImage,
  });

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();
}
