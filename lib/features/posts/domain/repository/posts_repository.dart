import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, Unit>> addPost({
    required String text,
    required File? imageFile,
  });

  Future<Either<Failure, List<Post>>> getAllPosts();

  Future<Either<Failure, Unit>> editPost(Post post);

  Future<Either<Failure, Unit>> deletePost(String postId);
}
