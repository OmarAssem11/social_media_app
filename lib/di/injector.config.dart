// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../features/auth/data/datasources/auth_local_datasource_impl.dart'
    as _i8;
import '../features/auth/data/datasources/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i10;
import '../features/auth/data/services/auth_firebase_service.dart' as _i3;
import '../features/auth/domain/datasources/auth_local_datasource.dart' as _i7;
import '../features/auth/domain/datasources/auth_remote_datasource.dart' as _i4;
import '../features/auth/domain/repositories/auth_repository.dart' as _i9;
import '../features/auth/domain/usecases/forgot_password_use_case.dart' as _i11;
import '../features/auth/domain/usecases/is_logged_in_use_case.dart' as _i12;
import '../features/auth/domain/usecases/login_use_case.dart' as _i13;
import '../features/auth/domain/usecases/logout_use_case.dart' as _i14;
import '../features/auth/domain/usecases/register_use_case.dart' as _i15;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i16;
import 'app_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AuthFirebaseService>(() => _i3.AuthFirebaseService());
  gh.lazySingleton<_i4.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImpl(get<_i3.AuthFirebaseService>()));
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i7.AuthLocalDataSource>(
      () => _i8.AuthLocalDataSourceImpl(get<_i6.SharedPreferences>()));
  gh.lazySingleton<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
      get<_i7.AuthLocalDataSource>(), get<_i4.AuthRemoteDataSource>()));
  gh.lazySingleton<_i11.ForgotPasswordUseCase>(
      () => _i11.ForgotPasswordUseCase(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i12.IsLoggedInUseCase>(
      () => _i12.IsLoggedInUseCase(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i13.LoginUseCase>(
      () => _i13.LoginUseCase(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i14.LogoutUseCase>(
      () => _i14.LogoutUseCase(get<_i9.AuthRepository>()));
  gh.lazySingleton<_i15.RegisterUseCase>(
      () => _i15.RegisterUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i16.AuthCubit>(() => _i16.AuthCubit(
      get<_i15.RegisterUseCase>(),
      get<_i13.LoginUseCase>(),
      get<_i14.LogoutUseCase>(),
      get<_i11.ForgotPasswordUseCase>(),
      get<_i12.IsLoggedInUseCase>()));
  return get;
}

class _$AppModule extends _i17.AppModule {}
