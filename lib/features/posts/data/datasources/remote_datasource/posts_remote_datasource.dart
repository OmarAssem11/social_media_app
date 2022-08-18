import 'dart:io';

import 'package:social_media_app/features/posts/data/models/post_model.dart';

abstract class PostsRemoteDataSource {
  Future<void> addPost(PostModel postModel);

  Future<List<PostModel>> getAllPosts();

  Future<void> editPost(PostModel postModel);

  Future<void> deletePost(String postId);

  Future<String> uploadImage(File imageFile);
}
