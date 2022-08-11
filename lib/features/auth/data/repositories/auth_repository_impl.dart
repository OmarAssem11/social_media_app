import 'package:injectable/injectable.dart';
import 'package:social_media_app/features/auth/domain/datasources/local_datasource.dart/auth_local_datasource.dart';
import 'package:social_media_app/features/auth/domain/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:social_media_app/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  final IAuthLocalDataSource _authLocalDataSource;
  final IAuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl(
    this._authLocalDataSource,
    this._authRemoteDataSource,
  );
}
