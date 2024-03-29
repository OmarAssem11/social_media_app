import 'package:social_media_app/features/auth/data/models/register_model/register_model.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';

extension RegisterModelMapper on RegisterModel {
  RegisterEntity get fromModel => RegisterEntity(
        name: name,
        email: email,
        password: password,
      );
}
