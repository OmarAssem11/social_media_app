import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/core/data/constants/key_constants.dart';
import 'package:social_media_app/core/data/exceptions/app_exception.dart';
import 'package:social_media_app/features/posts/data/datasources/local_datasource/posts_local_datasource.dart';
import 'package:social_media_app/features/posts/data/models/post_model.dart';

@LazySingleton(as: PostsLocalDataSource)
class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const PostsLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> cachePosts(List<PostModel> postModels) async {
    final postModelsJson =
        postModels.map((postModel) => postModel.toJson()).toList();
    _sharedPreferences.setString(
      KeyConstants.cachedPosts,
      jsonEncode(postModelsJson),
    );
  }

  @override
  Future<List<PostModel>> getCachedPosts() async {
    final cachedPostsJsonString =
        _sharedPreferences.getString(KeyConstants.cachedPosts);
    if (cachedPostsJsonString != null) {
      final cachedPostsDecodedData =
          jsonDecode(cachedPostsJsonString) as List<Map<String, dynamic>>;
      final postModel = cachedPostsDecodedData
          .map((postModelJson) => PostModel.fromJson(postModelJson))
          .toList();
      return postModel;
    } else {
      throw const LocalAppException.canNotAccess();
    }
  }
}
