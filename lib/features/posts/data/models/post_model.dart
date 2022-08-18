import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final String id;
  final String text;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @TimestampConverter()
  @JsonKey(name: 'date_time')
  final DateTime dateTime;
  @JsonKey(name: 'publisher_name')
  final String publisherName;
  @JsonKey(name: 'publisher_image')
  final String publisherImage;

  const PostModel({
    this.id = '',
    required this.text,
    this.imageUrl,
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
