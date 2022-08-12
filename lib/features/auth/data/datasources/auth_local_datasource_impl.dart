import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/core/data/constants/constants.dart';
import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/features/auth/domain/datasources/auth_local_datasource.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveUser(UserModel userModel) => _sharedPreferences.setString(
        Constants.userPrefKey,
        jsonEncode(userModel.toJson()),
      );

  @override
  String? getUser() => _sharedPreferences.getString(Constants.userPrefKey);

  @override
  Future<bool> deleteUser() => _sharedPreferences.remove(Constants.userPrefKey);
}
