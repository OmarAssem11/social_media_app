import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/core/domain/entities/user.dart';

extension UserModelMapper on UserModel {
  User get fromModel => User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
}
