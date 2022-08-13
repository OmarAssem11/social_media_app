import 'package:injectable/injectable.dart';
import 'package:social_media_app/features/posts/data/models/post_model.dart';

@lazySingleton
class PostsFirebaseService {
  const PostsFirebaseService();

  Future<void> addPost(PostModel postModel) async {}

  Future<List<PostModel>> getAllPosts() async => [];

  Future<void> editPost(PostModel postModel) async {}

  Future<void> deletePost(int postId) async {}
}
