// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as String,
      text: json['text'] as String,
      imageUrl: json['imageUrl'] as String,
      dateTime:
          const TimestampConverter().fromJson(json['dateTime'] as Timestamp),
      publisherName: json['publisherName'] as String,
      publisherImage: json['publisherImage'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'dateTime': const TimestampConverter().toJson(instance.dateTime),
      'publisherName': instance.publisherName,
      'publisherImage': instance.publisherImage,
    };
