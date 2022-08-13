import 'package:social_media_app/features/posts/data/models/post_model.dart';

abstract class PostsLocalDataSource {
  Future<void> cachePosts(List<PostModel> postModels);

  Future<List<PostModel>> getCachedPosts();
}
