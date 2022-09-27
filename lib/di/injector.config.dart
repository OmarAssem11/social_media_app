// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../core/data/datasources/cache_helper.dart' as _i14;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i10;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i11;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i13;
import '../features/auth/data/services/auth_firebase_service.dart' as _i3;
import '../features/auth/domain/repository/auth_repository.dart' as _i12;
import '../features/auth/domain/usecases/forgot_password_usecase.dart' as _i15;
import '../features/auth/domain/usecases/is_logged_in_usecase.dart' as _i16;
import '../features/auth/domain/usecases/login_usecase.dart' as _i17;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i18;
import '../features/auth/domain/usecases/register_usecase.dart' as _i23;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i25;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource.dart'
    as _i19;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource_impl.dart'
    as _i20;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart'
    as _i7;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource_impl.dart'
    as _i8;
import '../features/posts/data/repository/posts_repository_impl.dart' as _i22;
import '../features/posts/data/services/posts_firebase_service.dart' as _i6;
import '../features/posts/domain/repository/posts_repository.dart' as _i21;
import '../features/posts/domain/usecases/add_post_usecase.dart' as _i24;
import '../features/posts/domain/usecases/delete_post_usecase.dart' as _i26;
import '../features/posts/domain/usecases/edit_post_usecase.dart' as _i27;
import '../features/posts/domain/usecases/get_all_posts_usecase.dart' as _i28;
import '../features/posts/presentation/cubit/posts_cubit.dart' as _i29;
import 'app_module.dart' as _i30; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i14.CacheHelper>(
      _i14.CacheHelperImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i15.ForgotPasswordUseCase>(
      () => _i15.ForgotPasswordUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i16.IsLoggedInUseCase>(
      () => _i16.IsLoggedInUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i18.LogoutUseCase>(
      () => _i18.LogoutUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i19.PostsLocalDataSource>(
      () => _i20.PostsLocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i21.PostsRepository>(() => _i22.PostsRepositoryImpl(
      get<_i7.PostsRemoteDataSource>(),
      get<_i19.PostsLocalDataSource>(),
      get<_i10.AuthLocalDataSource>()));
  gh.lazySingleton<_i23.RegisterUseCase>(
      () => _i23.RegisterUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i24.AddPostUseCase>(
      () => _i24.AddPostUseCase(get<_i21.PostsRepository>()));
  gh.factory<_i25.AuthCubit>(() => _i25.AuthCubit(
      get<_i23.RegisterUseCase>(),
      get<_i17.LoginUseCase>(),
      get<_i18.LogoutUseCase>(),
      get<_i15.ForgotPasswordUseCase>(),
      get<_i16.IsLoggedInUseCase>()));
  gh.lazySingleton<_i26.DeletePostUseCase>(
      () => _i26.DeletePostUseCase(get<_i21.PostsRepository>()));
  gh.lazySingleton<_i27.EditPostUseCase>(
      () => _i27.EditPostUseCase(get<_i21.PostsRepository>()));
  gh.lazySingleton<_i28.GetAllPostsUseCase>(
      () => _i28.GetAllPostsUseCase(get<_i21.PostsRepository>()));
  gh.factory<_i29.PostsCubit>(() => _i29.PostsCubit(
      get<_i24.AddPostUseCase>(),
      get<_i28.GetAllPostsUseCase>(),
      get<_i27.EditPostUseCase>(),
      get<_i26.DeletePostUseCase>()));
  return get;
}

class _$AppModule extends _i30.AppModule {}
