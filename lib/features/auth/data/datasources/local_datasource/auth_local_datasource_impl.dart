import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/core/presentation/util/strings_manager.dart';
import 'package:social_media_app/features/auth/domain/datasources/local_datasource.dart/auth_local_datasource.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveUser(UserModel userModel) => _sharedPreferences.setString(
        AppStrings.userKey,
        jsonEncode(userModel.toJson()),
      );

  @override
  String? getUser() => _sharedPreferences.getString(
        AppStrings.userKey,
      );

  @override
  Future<bool> deleteUser() => _sharedPreferences.remove(
        AppStrings.userKey,
      );
}
