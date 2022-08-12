import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/app_exception.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/failure/return_failure.dart';
import 'package:social_media_app/features/auth/data/mappers/login_mappers/login_entity_mapper.dart';
import 'package:social_media_app/features/auth/data/mappers/register_mappers/register_entity_mapper.dart';
import 'package:social_media_app/features/auth/domain/datasources/local_datasource.dart/auth_local_datasource.dart';
import 'package:social_media_app/features/auth/domain/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';
import 'package:social_media_app/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl(
    this._authLocalDataSource,
    this._authRemoteDataSource,
  );

  @override
  Future<Either<Failure, Unit>> register({
    required RegisterEntity registerEntity,
  }) async {
    try {
      final userModel =
          await _authRemoteDataSource.register(registerEntity.toModel);
      _authLocalDataSource.saveUser(userModel);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> login(LoginEntity loginEntity) async {
    try {
      final userModel = await _authRemoteDataSource.login(loginEntity.toModel);
      _authLocalDataSource.saveUser(userModel);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
