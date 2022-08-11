import 'package:social_media_app/features/auth/data/models/register_model.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';

extension RegisterEntityMapper on RegisterEntity {
  RegisterModel get toModel => RegisterModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
}
