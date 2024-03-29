import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @Default('') String id,
    String? text,
    String? imageUrl,
    required DateTime dateTime,
    required String publisherName,
    required String publisherImage,
  }) = _Post;
}
