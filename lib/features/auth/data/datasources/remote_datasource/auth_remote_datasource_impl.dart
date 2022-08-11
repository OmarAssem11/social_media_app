import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/return_app_exception.dart';
import 'package:social_media_app/features/auth/data/models/register_model.dart';
import 'package:social_media_app/features/auth/data/services/auth_firebase_service.dart';
import 'package:social_media_app/features/auth/domain/datasources/remote_datasource/auth_remote_datasource.dart';

@lazySingleton
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthFirebaseService _authFirebaseService;

  const AuthRemoteDataSourceImpl(this._authFirebaseService);

  @override
  Future<void> register({required RegisterModel registerModel}) async {
    try {
      await _authFirebaseService.register();
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }
}
