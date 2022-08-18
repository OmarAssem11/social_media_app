// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as String? ?? '',
      text: json['text'] as String,
      imageUrl: json['image_url'] as String?,
      dateTime:
          const TimestampConverter().fromJson(json['date_time'] as Timestamp),
      publisherName: json['publisher_name'] as String,
      publisherImage: json['publisher_image'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'image_url': instance.imageUrl,
      'date_time': const TimestampConverter().toJson(instance.dateTime),
      'publisher_name': instance.publisherName,
      'publisher_image': instance.publisherImage,
    };
