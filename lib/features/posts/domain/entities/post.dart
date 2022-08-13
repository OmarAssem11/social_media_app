import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @Default('') String id,
    required String text,
    required String imageUrl,
    required DateTime dateTime,
    required String publisherName,
    required String publisherImage,
  }) = _Post;
}
