import 'package:social_media_app/features/auth/data/models/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> register({
    required RegisterModel registerModel,
  });
}
