import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/features/auth/data/models/login_model/login_model.dart';
import 'package:social_media_app/features/auth/data/models/register_model/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(RegisterModel registerModel);

  Future<UserModel> login(LoginModel loginModel);

  Future<void> logout();
}
