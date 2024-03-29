import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/core/data/constants/key_constants.dart';
import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/features/auth/data/datasources/local_datasource/auth_local_datasource.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveUser(UserModel userModel) => _sharedPreferences.setString(
        KeyConstants.user,
        jsonEncode(userModel.toJson()),
      );

  @override
  String? getUser() => _sharedPreferences.getString(KeyConstants.user);

  @override
  Future<bool> deleteUser() => _sharedPreferences.remove(KeyConstants.user);
}
