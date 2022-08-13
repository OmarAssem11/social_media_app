// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i11;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i12;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i14;
import '../features/auth/data/services/auth_firebase_service.dart' as _i3;
import '../features/auth/domain/repository/auth_repository.dart' as _i13;
import '../features/auth/domain/usecases/forgot_password_usecase.dart' as _i15;
import '../features/auth/domain/usecases/is_logged_in_usecase.dart' as _i16;
import '../features/auth/domain/usecases/login_usecase.dart' as _i17;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i18;
import '../features/auth/domain/usecases/register_usecase.dart' as _i21;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i22;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource.dart'
    as _i19;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource_impl.dart'
    as _i20;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart'
    as _i7;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource_impl.dart'
    as _i8;
import '../features/posts/data/repository/posts_repository_impl.dart' as _i9;
import '../features/posts/data/services/posts_firebase_service.dart' as _i6;
import 'app_module.dart' as _i23; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.PostsRepositoryImpl>(() => _i9.PostsRepositoryImpl());
  await gh.factoryAsync<_i10.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i11.AuthLocalDataSource>(
      () => _i12.AuthLocalDataSourceImpl(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
      get<_i11.AuthLocalDataSource>(), get<_i4.AuthRemoteDataSource>()));
  gh.lazySingleton<_i15.ForgotPasswordUseCase>(
      () => _i15.ForgotPasswordUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i16.IsLoggedInUseCase>(
      () => _i16.IsLoggedInUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i18.LogoutUseCase>(
      () => _i18.LogoutUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i19.PostsLocalDataSource>(
      () => _i20.PostsLocalDataSourceImpl(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i21.RegisterUseCase>(
      () => _i21.RegisterUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i22.AuthCubit>(() => _i22.AuthCubit(
      get<_i21.RegisterUseCase>(),
      get<_i17.LoginUseCase>(),
      get<_i18.LogoutUseCase>(),
      get<_i15.ForgotPasswordUseCase>(),
      get<_i16.IsLoggedInUseCase>()));
  return get;
}

class _$AppModule extends _i23.AppModule {}
