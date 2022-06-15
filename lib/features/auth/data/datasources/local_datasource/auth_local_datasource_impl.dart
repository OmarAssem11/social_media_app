import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/core/presentation/util/strings_manager.dart';
import 'package:social_media_app/features/auth/domain/datasources/local_datasource.dart/auth_local_datasource.dart';

@LazySingleton(as: IAuthLocalDataSource)
class AuthLocalDataSourceImpl implements IAuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveToken(String token) => _sharedPreferences.setString(
        AppStrings.tokenKey,
        token,
      );

  @override
  String? getToken() => _sharedPreferences.getString(
        AppStrings.tokenKey,
      );

  @override
  Future<bool> deleteToken() => _sharedPreferences.remove(
        AppStrings.tokenKey,
      );
}
