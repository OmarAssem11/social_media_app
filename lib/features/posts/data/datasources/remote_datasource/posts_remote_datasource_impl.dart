import 'package:injectable/injectable.dart';
import 'package:social_media_app/features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart';
import 'package:social_media_app/features/posts/data/services/posts_firebase_service.dart';

@LazySingleton(as: PostsRemoteDataSource)
class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final PostsFirebaseService _postsFirebaseService;

  const PostsRemoteDataSourceImpl(this._postsFirebaseService);
}
