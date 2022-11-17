// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/data/datasources/cache_helper.dart' as _i15;
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
import '../features/auth/domain/usecases/forgot_password_usecase.dart' as _i16;
import '../features/auth/domain/usecases/get_current_user_usecase.dart' as _i17;
import '../features/auth/domain/usecases/is_logged_in_usecase.dart' as _i18;
import '../features/auth/domain/usecases/login_usecase.dart' as _i19;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i20;
import '../features/auth/domain/usecases/register_usecase.dart' as _i25;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i27;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource.dart'
    as _i21;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource_impl.dart'
    as _i22;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart'
    as _i7;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource_impl.dart'
    as _i8;
import '../features/posts/data/repository/posts_repository_impl.dart' as _i24;
import '../features/posts/data/services/posts_firebase_service.dart' as _i6;
import '../features/posts/domain/repository/posts_repository.dart' as _i23;
import '../features/posts/domain/usecases/add_post_usecase.dart' as _i26;
import '../features/posts/domain/usecases/delete_post_usecase.dart' as _i28;
import '../features/posts/domain/usecases/edit_post_usecase.dart' as _i29;
import '../features/posts/domain/usecases/get_all_posts_usecase.dart' as _i30;
import '../features/posts/presentation/cubit/posts_cubit.dart' as _i31;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i9;
import 'app_module.dart' as _i32; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i9.SettingsCubit>(_i9.SettingsCubit());
  await gh.factoryAsync<_i10.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i11.AuthLocalDataSource>(
      () => _i12.AuthLocalDataSourceImpl(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
      get<_i11.AuthLocalDataSource>(), get<_i4.AuthRemoteDataSource>()));
  gh.singleton<_i15.CacheHelper>(
      _i15.CacheHelperImpl(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i16.ForgotPasswordUseCase>(
      () => _i16.ForgotPasswordUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i17.GetCurrentUserUseCase>(
      () => _i17.GetCurrentUserUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i18.IsLoggedInUseCase>(
      () => _i18.IsLoggedInUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i19.LoginUseCase>(
      () => _i19.LoginUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i20.LogoutUseCase>(
      () => _i20.LogoutUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i21.PostsLocalDataSource>(
      () => _i22.PostsLocalDataSourceImpl(get<_i10.SharedPreferences>()));
  gh.lazySingleton<_i23.PostsRepository>(() => _i24.PostsRepositoryImpl(
      get<_i7.PostsRemoteDataSource>(),
      get<_i21.PostsLocalDataSource>(),
      get<_i11.AuthLocalDataSource>()));
  gh.lazySingleton<_i25.RegisterUseCase>(
      () => _i25.RegisterUseCase(get<_i13.AuthRepository>()));
  gh.lazySingleton<_i26.AddPostUseCase>(
      () => _i26.AddPostUseCase(get<_i23.PostsRepository>()));
  gh.factory<_i27.AuthCubit>(() => _i27.AuthCubit(
      get<_i25.RegisterUseCase>(),
      get<_i19.LoginUseCase>(),
      get<_i20.LogoutUseCase>(),
      get<_i16.ForgotPasswordUseCase>(),
      get<_i18.IsLoggedInUseCase>(),
      get<_i17.GetCurrentUserUseCase>()));
  gh.lazySingleton<_i28.DeletePostUseCase>(
      () => _i28.DeletePostUseCase(get<_i23.PostsRepository>()));
  gh.lazySingleton<_i29.EditPostUseCase>(
      () => _i29.EditPostUseCase(get<_i23.PostsRepository>()));
  gh.lazySingleton<_i30.GetAllPostsUseCase>(
      () => _i30.GetAllPostsUseCase(get<_i23.PostsRepository>()));
  gh.factory<_i31.PostsCubit>(() => _i31.PostsCubit(
      get<_i26.AddPostUseCase>(),
      get<_i30.GetAllPostsUseCase>(),
      get<_i29.EditPostUseCase>(),
      get<_i28.DeletePostUseCase>()));
  return get;
}

class _$AppModule extends _i32.AppModule {}
