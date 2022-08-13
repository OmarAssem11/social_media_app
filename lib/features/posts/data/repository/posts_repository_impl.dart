import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/app_exception.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/failure/return_failure.dart';
import 'package:social_media_app/features/posts/data/datasources/local_datasource/posts_local_datasource.dart';
import 'package:social_media_app/features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart';
import 'package:social_media_app/features/posts/data/mappers/post_mapper.dart';
import 'package:social_media_app/features/posts/data/mappers/post_model_mapper.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';
import 'package:social_media_app/features/posts/domain/repository/posts_repository.dart';

@LazySingleton(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsLocalDataSource _postsLocalDataSource;
  final PostsRemoteDataSource _postsRemoteDataSource;

  const PostsRepositoryImpl(
    this._postsLocalDataSource,
    this._postsRemoteDataSource,
  );

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    try {
      await _postsRemoteDataSource.addPost(post.toModel);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final postModel = await _postsRemoteDataSource.getAllPosts();
      final posts = postModel.map((postModel) => postModel.fromModel).toList();
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
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    try {
      await _postsRemoteDataSource.deletePost(postId);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
