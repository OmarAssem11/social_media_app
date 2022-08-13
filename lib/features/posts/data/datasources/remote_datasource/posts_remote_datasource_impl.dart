import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/return_app_exception.dart';
import 'package:social_media_app/features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart';
import 'package:social_media_app/features/posts/data/models/post_model.dart';
import 'package:social_media_app/features/posts/data/services/posts_firebase_service.dart';

@LazySingleton(as: PostsRemoteDataSource)
class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final PostsFirebaseService _postsFirebaseService;

  const PostsRemoteDataSourceImpl(this._postsFirebaseService);

  @override
  Future<void> addPost(PostModel postModel) {
    try {
      return _postsFirebaseService.addPost(postModel);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    try {
      return _postsFirebaseService.getAllPosts();
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<void> editPost(PostModel postModel) {
    try {
      return _postsFirebaseService.editPost(postModel);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<void> deletePost(String postId) {
    try {
      return _postsFirebaseService.deletePost(postId);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }
}
