import 'package:social_media_app/features/posts/data/models/post_model.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';

extension PostMapper on Post {
  PostModel get toModel => PostModel(
        content: content,
      );
}
