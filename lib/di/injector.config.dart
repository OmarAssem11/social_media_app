// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i10;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i11;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i13;
import '../features/auth/data/services/auth_firebase_service.dart' as _i3;
import '../features/auth/domain/repositories/auth_repository.dart' as _i12;
import '../features/auth/domain/usecases/forgot_password_use_case.dart' as _i14;
import '../features/auth/domain/usecases/is_logged_in_use_case.dart' as _i15;
import '../features/auth/domain/usecases/login_use_case.dart' as _i16;
import '../features/auth/domain/usecases/logout_use_case.dart' as _i17;
import '../features/auth/domain/usecases/register_use_case.dart' as _i20;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i21;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource.dart'
    as _i18;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource_impl.dart'
    as _i19;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart'
    as _i7;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource_impl.dart'
    as _i8;
import '../features/posts/data/services/posts_firebase_service.dart' as _i6;
import 'app_module.dart' as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AuthFirebaseService>(() => _i3.AuthFirebaseService());
  gh.lazySingleton<_i4.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImpl(get<_i3.AuthFirebaseService>()));
  gh.lazySingleton<_i6.PostsFirebaseService>(() => _i6.PostsFirebaseService());
  gh.lazySingleton<_i7.PostsRemoteDataSource>(
      () => _i8.PostsRemoteDataSourceImpl(get<_i6.PostsFirebaseService>()));
  await gh.factoryAsync<_i9.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i10.AuthLocalDataSource>(
      () => _i11.AuthLocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
      get<_i10.AuthLocalDataSource>(), get<_i4.AuthRemoteDataSource>()));
  gh.lazySingleton<_i14.ForgotPasswordUseCase>(
      () => _i14.ForgotPasswordUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i15.IsLoggedInUseCase>(
      () => _i15.IsLoggedInUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i16.LoginUseCase>(
      () => _i16.LoginUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i17.LogoutUseCase>(
      () => _i17.LogoutUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i18.PostsLocalDataSource>(
      () => _i19.PostsLocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i20.RegisterUseCase>(
      () => _i20.RegisterUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i21.AuthCubit>(() => _i21.AuthCubit(
      get<_i20.RegisterUseCase>(),
      get<_i16.LoginUseCase>(),
      get<_i17.LogoutUseCase>(),
      get<_i14.ForgotPasswordUseCase>(),
      get<_i15.IsLoggedInUseCase>()));
  return get;
}

class _$AppModule extends _i22.AppModule {}
