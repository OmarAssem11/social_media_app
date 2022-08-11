import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/return_app_exception.dart';
import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/features/auth/data/models/register_model.dart';
import 'package:social_media_app/features/auth/data/services/auth_firebase_service.dart';
import 'package:social_media_app/features/auth/domain/datasources/remote_datasource/auth_remote_datasource.dart';

@lazySingleton
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthFirebaseService _authFirebaseService;

  const AuthRemoteDataSourceImpl(this._authFirebaseService);

  @override
  Future<UserModel> register({required RegisterModel registerModel}) async {
    try {
      await _authFirebaseService.register();
      return _authFirebaseService.register(registerModel);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }
}
