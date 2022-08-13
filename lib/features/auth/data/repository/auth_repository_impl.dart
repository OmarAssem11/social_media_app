import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/app_exception.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/failure/return_failure.dart';
import 'package:social_media_app/features/auth/data/datasources/local_datasource/auth_local_datasource.dart';
import 'package:social_media_app/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:social_media_app/features/auth/data/mappers/login_mappers/login_entity_mapper.dart';
import 'package:social_media_app/features/auth/data/mappers/register_mappers/register_entity_mapper.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl(
    this._authLocalDataSource,
    this._authRemoteDataSource,
  );

  @override
  Future<Either<Failure, Unit>> register(RegisterEntity registerEntity) async {
    try {
      final userModel =
          await _authRemoteDataSource.register(registerEntity.toModel);
      await _authLocalDataSource.saveUser(userModel);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> login(LoginEntity loginEntity) async {
    try {
      final userModel = await _authRemoteDataSource.login(loginEntity.toModel);
      await _authLocalDataSource.saveUser(userModel);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _authRemoteDataSource.logout();
      await _authLocalDataSource.deleteUser();
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(String email) async {
    try {
      await _authRemoteDataSource.forgotPassword(email);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final firebaseUser = _authRemoteDataSource.getCurrentUser();
      final prefUser = _authLocalDataSource.getUser();
      if (firebaseUser != null && prefUser != null) {
        return right(true);
      } else {
        return right(false);
      }
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
