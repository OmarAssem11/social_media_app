import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/features/auth/data/models/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register({
    required RegisterModel registerModel,
  });
}
