import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/core/domain/entities/user.dart';

extension UserMapper on User {
  UserModel get toModel => UserModel(
        id: id,
        name: name,
        email: email,
        password: password,
        imageUrl: imageUrl,
      );
}
