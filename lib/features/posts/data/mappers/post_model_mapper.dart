import 'package:social_media_app/features/posts/data/models/post_model.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';

extension PostModelMapper on PostModel {
  Post get fromModel => Post(
        content: content,
      );
}
