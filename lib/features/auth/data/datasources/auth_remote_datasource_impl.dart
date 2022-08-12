import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/return_app_exception.dart';
import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/features/auth/data/models/login_model/login_model.dart';
import 'package:social_media_app/features/auth/data/models/register_model/register_model.dart';
import 'package:social_media_app/features/auth/data/services/auth_firebase_service.dart';
import 'package:social_media_app/features/auth/domain/datasources/auth_remote_datasource.dart';

@lazySingleton
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthFirebaseService _authFirebaseService;

  const AuthRemoteDataSourceImpl(this._authFirebaseService);

  @override
  Future<UserModel> register(RegisterModel registerModel) async {
    try {
      return _authFirebaseService.register(registerModel);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<UserModel> login(LoginModel loginModel) async {
    try {
      return _authFirebaseService.login(loginModel);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<void> logout() async {
    try {
      return _authFirebaseService.logout();
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  User? getCurrentUser() {
    try {
      return _authFirebaseService.getCurrentUser();
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }
}
