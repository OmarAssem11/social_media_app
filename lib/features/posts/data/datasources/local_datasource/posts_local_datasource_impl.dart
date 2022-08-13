import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/features/posts/data/datasources/local_datasource/posts_local_datasource.dart';

@LazySingleton(as: PostsLocalDataSource)
class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const PostsLocalDataSourceImpl(this._sharedPreferences);
}
