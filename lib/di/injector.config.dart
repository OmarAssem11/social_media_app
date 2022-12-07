// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../core/data/datasources/cache_helper.dart' as _i21;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i17;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i18;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i20;
import '../features/auth/data/services/auth_firebase_service.dart' as _i3;
import '../features/auth/domain/repository/auth_repository.dart' as _i19;
import '../features/auth/domain/usecases/forgot_password_usecase.dart' as _i22;
import '../features/auth/domain/usecases/get_current_user_usecase.dart' as _i23;
import '../features/auth/domain/usecases/is_logged_in_usecase.dart' as _i24;
import '../features/auth/domain/usecases/login_usecase.dart' as _i25;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i26;
import '../features/auth/domain/usecases/register_usecase.dart' as _i31;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i33;
import '../features/chat/data/datasources/remote_datasource/chat_remote_datasource.dart'
    as _i6;
import '../features/chat/data/datasources/remote_datasource/chat_remote_datasource_impl.dart'
    as _i7;
import '../features/chat/data/repository/chat_repository_impl.dart' as _i9;
import '../features/chat/domain/repository/chat_repository.dart' as _i8;
import '../features/chat/domain/usecases/get_messages_usecase.dart' as _i10;
import '../features/chat/domain/usecases/send_message_usecase.dart' as _i14;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource.dart'
    as _i27;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource_impl.dart'
    as _i28;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart'
    as _i12;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource_impl.dart'
    as _i13;
import '../features/posts/data/repository/posts_repository_impl.dart' as _i30;
import '../features/posts/data/services/posts_firebase_service.dart' as _i11;
import '../features/posts/domain/repository/posts_repository.dart' as _i29;
import '../features/posts/domain/usecases/add_post_usecase.dart' as _i32;
import '../features/posts/domain/usecases/delete_post_usecase.dart' as _i34;
import '../features/posts/domain/usecases/edit_post_usecase.dart' as _i35;
import '../features/posts/domain/usecases/get_all_posts_usecase.dart' as _i36;
import '../features/posts/presentation/cubit/posts_cubit.dart' as _i37;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i15;
import 'app_module.dart' as _i38; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AuthFirebaseService>(() => _i3.AuthFirebaseService());
  gh.lazySingleton<_i4.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImpl(get<_i3.AuthFirebaseService>()));
  gh.lazySingleton<_i6.ChatRemoteDataSource>(
      () => _i7.ChatRemoteDataSourceImpl());
  gh.lazySingleton<_i8.ChatRepository>(() => _i9.ChatRepositoryImpl());
  gh.lazySingleton<_i10.GetMessagesUseCase>(
      () => _i10.GetMessagesUseCase(get<_i8.ChatRepository>()));
  gh.lazySingleton<_i11.PostsFirebaseService>(
      () => _i11.PostsFirebaseService());
  gh.lazySingleton<_i12.PostsRemoteDataSource>(
      () => _i13.PostsRemoteDataSourceImpl(get<_i11.PostsFirebaseService>()));
  gh.lazySingleton<_i14.SendMessageUseCase>(
      () => _i14.SendMessageUseCase(get<_i8.ChatRepository>()));
  gh.singleton<_i15.SettingsCubit>(_i15.SettingsCubit());
  await gh.factoryAsync<_i16.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i17.AuthLocalDataSource>(
      () => _i18.AuthLocalDataSourceImpl(get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i19.AuthRepository>(() => _i20.AuthRepositoryImpl(
      get<_i17.AuthLocalDataSource>(), get<_i4.AuthRemoteDataSource>()));
  gh.singleton<_i21.CacheHelper>(
      _i21.CacheHelperImpl(get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i22.ForgotPasswordUseCase>(
      () => _i22.ForgotPasswordUseCase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i23.GetCurrentUserUseCase>(
      () => _i23.GetCurrentUserUseCase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i24.IsLoggedInUseCase>(
      () => _i24.IsLoggedInUseCase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i25.LoginUseCase>(
      () => _i25.LoginUseCase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i26.LogoutUseCase>(
      () => _i26.LogoutUseCase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i27.PostsLocalDataSource>(
      () => _i28.PostsLocalDataSourceImpl(get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i29.PostsRepository>(() => _i30.PostsRepositoryImpl(
      get<_i12.PostsRemoteDataSource>(),
      get<_i27.PostsLocalDataSource>(),
      get<_i17.AuthLocalDataSource>()));
  gh.lazySingleton<_i31.RegisterUseCase>(
      () => _i31.RegisterUseCase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i32.AddPostUseCase>(
      () => _i32.AddPostUseCase(get<_i29.PostsRepository>()));
  gh.factory<_i33.AuthCubit>(() => _i33.AuthCubit(
      get<_i31.RegisterUseCase>(),
      get<_i25.LoginUseCase>(),
      get<_i26.LogoutUseCase>(),
      get<_i22.ForgotPasswordUseCase>(),
      get<_i24.IsLoggedInUseCase>(),
      get<_i23.GetCurrentUserUseCase>()));
  gh.lazySingleton<_i34.DeletePostUseCase>(
      () => _i34.DeletePostUseCase(get<_i29.PostsRepository>()));
  gh.lazySingleton<_i35.EditPostUseCase>(
      () => _i35.EditPostUseCase(get<_i29.PostsRepository>()));
  gh.lazySingleton<_i36.GetAllPostsUseCase>(
      () => _i36.GetAllPostsUseCase(get<_i29.PostsRepository>()));
  gh.factory<_i37.PostsCubit>(() => _i37.PostsCubit(
      get<_i32.AddPostUseCase>(),
      get<_i36.GetAllPostsUseCase>(),
      get<_i35.EditPostUseCase>(),
      get<_i34.DeletePostUseCase>()));
  return get;
}

class _$AppModule extends _i38.AppModule {}
