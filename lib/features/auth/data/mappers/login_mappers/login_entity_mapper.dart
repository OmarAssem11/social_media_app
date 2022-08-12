import 'package:social_media_app/features/auth/data/models/login_model/login_model.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';

extension LoginEntityMapper on LoginEntity {
  LoginModel get toModel => LoginModel(
        email: email,
        password: password,
      );
}
