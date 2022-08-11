// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i6;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i3;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i8;
import '../features/auth/domain/datasources/local_datasource.dart/auth_local_datasource.dart'
    as _i5;
import '../features/auth/domain/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i9;
import '../features/auth/domain/repositories/auth_repository.dart' as _i7;
import '../features/auth/domain/usecases/register_use_case.dart' as _i10;
import 'app_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AuthRemoteDataSourceImpl>(
      () => _i3.AuthRemoteDataSourceImpl());
  await gh.factoryAsync<_i4.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i5.IAuthLocalDataSource>(
      () => _i6.AuthLocalDataSourceImpl(get<_i4.SharedPreferences>()));
  gh.lazySingleton<_i7.IAuthRepository>(() => _i8.AuthRepositoryImpl(
      get<_i5.IAuthLocalDataSource>(), get<_i9.IAuthRemoteDataSource>()));
  gh.lazySingleton<_i10.RegisterUseCase>(
      () => _i10.RegisterUseCase(get<_i7.IAuthRepository>()));
  return get;
}

class _$AppModule extends _i11.AppModule {}
