import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/app_exception.dart';
import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/failure/return_failure.dart';
import 'package:social_media_app/features/auth/data/datasources/local_datasource/auth_local_datasource.dart';
import 'package:social_media_app/features/posts/data/datasources/local_datasource/posts_local_datasource.dart';
import 'package:social_media_app/features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart';
import 'package:social_media_app/features/posts/data/mappers/post_mapper.dart';
import 'package:social_media_app/features/posts/data/mappers/post_model_mapper.dart';
import 'package:social_media_app/features/posts/data/models/post_model.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';
import 'package:social_media_app/features/posts/domain/repository/posts_repository.dart';

@LazySingleton(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource _postsRemoteDataSource;
  final PostsLocalDataSource _postsLocalDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  const PostsRepositoryImpl(
    this._postsRemoteDataSource,
    this._postsLocalDataSource,
    this._authLocalDataSource,
  );

  @override
  Future<Either<Failure, Unit>> addPost({
    required String text,
    required File? imageFile,
  }) async {
    try {
      final userString = _authLocalDataSource.getUser()!;
      final userJson = jsonDecode(userString) as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userJson);
      String? imageUrl;
      if (imageFile != null) {
        imageUrl = await _postsRemoteDataSource.uploadImage(imageFile);
      }
      await _postsRemoteDataSource.addPost(
        PostModel(
          text: text,
          imageUrl: imageUrl,
          dateTime: DateTime.now(),
          publisherName: userModel.name,
          publisherImage: userModel.imageUrl,
        ),
      );
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final postModels = await _postsRemoteDataSource.getAllPosts();
      await _postsLocalDataSource.cachePosts(postModels);
      final posts = postModels.map((postModel) => postModel.fromModel).toList();
      return right(posts);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> editPost(Post post) async {
    try {
      await _postsRemoteDataSource.editPost(post.toModel);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(String postId) async {
    try {
      await _postsRemoteDataSource.deletePost(postId);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
