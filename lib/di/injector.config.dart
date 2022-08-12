// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../features/auth/data/datasources/auth_local_datasource_impl.dart'
    as _i7;
import '../features/auth/data/datasources/auth_remote_datasource_impl.dart'
    as _i3;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i9;
import '../features/auth/data/services/auth_firebase_service.dart' as _i4;
import '../features/auth/domain/datasources/auth_local_datasource.dart' as _i6;
import '../features/auth/domain/datasources/auth_remote_datasource.dart'
    as _i10;
import '../features/auth/domain/repositories/auth_repository.dart' as _i8;
import '../features/auth/domain/usecases/login_use_case.dart' as _i11;
import '../features/auth/domain/usecases/logout_use_case.dart' as _i12;
import '../features/auth/domain/usecases/register_use_case.dart' as _i13;
import 'app_module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AuthRemoteDataSourceImpl>(
      () => _i3.AuthRemoteDataSourceImpl(get<_i4.AuthFirebaseService>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i6.AuthLocalDataSource>(
      () => _i7.AuthLocalDataSourceImpl(get<_i5.SharedPreferences>()));
  gh.lazySingleton<_i8.AuthRepository>(() => _i9.AuthRepositoryImpl(
      get<_i6.AuthLocalDataSource>(), get<_i10.AuthRemoteDataSource>()));
  gh.lazySingleton<_i11.LoginUseCase>(
      () => _i11.LoginUseCase(get<_i8.AuthRepository>()));
  gh.lazySingleton<_i12.LogoutUseCase>(
      () => _i12.LogoutUseCase(get<_i8.AuthRepository>()));
  gh.lazySingleton<_i13.RegisterUseCase>(
      () => _i13.RegisterUseCase(get<_i8.AuthRepository>()));
  return get;
}

class _$AppModule extends _i14.AppModule {}
