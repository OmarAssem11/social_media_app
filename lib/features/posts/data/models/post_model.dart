import 'package:json_annotation/json_annotation.dart';
import 'package:social_media_app/core/data/json_converters/date_time_converter.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final String id;
  final String? text;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @DateTimeConverter()
  @JsonKey(name: 'date_time')
  final DateTime dateTime;
  @JsonKey(name: 'publisher_name')
  final String publisherName;
  @JsonKey(name: 'publisher_image')
  final String publisherImage;

  const PostModel({
    this.id = '',
    this.text,
    this.imageUrl,
    required this.dateTime,
    required this.publisherName,
    required this.publisherImage,
  });

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
