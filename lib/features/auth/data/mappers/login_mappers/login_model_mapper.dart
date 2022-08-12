import 'package:social_media_app/features/auth/data/models/login_model/login_model.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';

extension LoginModelMapper on LoginModel {
  LoginEntity get fromModel => LoginEntity(
        email: email,
        password: password,
      );
}
