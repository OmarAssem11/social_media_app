// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../core/data/datasources/cache_helper.dart' as _i22;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i18;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i19;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i21;
import '../features/auth/data/services/auth_firebase_service.dart' as _i3;
import '../features/auth/domain/repository/auth_repository.dart' as _i20;
import '../features/auth/domain/usecases/forgot_password_usecase.dart' as _i23;
import '../features/auth/domain/usecases/get_current_user_usecase.dart' as _i24;
import '../features/auth/domain/usecases/is_logged_in_usecase.dart' as _i25;
import '../features/auth/domain/usecases/login_usecase.dart' as _i26;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i27;
import '../features/auth/domain/usecases/register_usecase.dart' as _i32;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i34;
import '../features/chat/data/datasources/remote_datasource/chat_remote_datasource.dart'
    as _i7;
import '../features/chat/data/datasources/remote_datasource/chat_remote_datasource_impl.dart'
    as _i8;
import '../features/chat/data/repository/chat_repository_impl.dart' as _i10;
import '../features/chat/data/services/chat_firebase_service.dart' as _i6;
import '../features/chat/domain/repository/chat_repository.dart' as _i9;
import '../features/chat/domain/usecases/get_messages_usecase.dart' as _i11;
import '../features/chat/domain/usecases/send_message_usecase.dart' as _i15;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource.dart'
    as _i28;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource_impl.dart'
    as _i29;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart'
    as _i13;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource_impl.dart'
    as _i14;
import '../features/posts/data/repository/posts_repository_impl.dart' as _i31;
import '../features/posts/data/services/posts_firebase_service.dart' as _i12;
import '../features/posts/domain/repository/posts_repository.dart' as _i30;
import '../features/posts/domain/usecases/add_post_usecase.dart' as _i33;
import '../features/posts/domain/usecases/delete_post_usecase.dart' as _i35;
import '../features/posts/domain/usecases/edit_post_usecase.dart' as _i36;
import '../features/posts/domain/usecases/get_all_posts_usecase.dart' as _i37;
import '../features/posts/presentation/cubit/posts_cubit.dart' as _i38;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i16;
import 'app_module.dart' as _i39; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AuthFirebaseService>(() => _i3.AuthFirebaseService());
  gh.lazySingleton<_i4.AuthRemoteDataSource>(
      () => _i5.AuthRemoteDataSourceImpl(get<_i3.AuthFirebaseService>()));
  gh.lazySingleton<_i6.ChatFirebaseService>(() => _i6.ChatFirebaseService());
  gh.lazySingleton<_i7.ChatRemoteDataSource>(
      () => _i8.ChatRemoteDataSourceImpl(get<_i6.ChatFirebaseService>()));
  gh.lazySingleton<_i9.ChatRepository>(
      () => _i10.ChatRepositoryImpl(get<_i7.ChatRemoteDataSource>()));
  gh.lazySingleton<_i11.GetMessagesUseCase>(
      () => _i11.GetMessagesUseCase(get<_i9.ChatRepository>()));
  gh.lazySingleton<_i12.PostsFirebaseService>(
      () => _i12.PostsFirebaseService());
  gh.lazySingleton<_i13.PostsRemoteDataSource>(
      () => _i14.PostsRemoteDataSourceImpl(get<_i12.PostsFirebaseService>()));
  gh.lazySingleton<_i15.SendMessageUseCase>(
      () => _i15.SendMessageUseCase(get<_i9.ChatRepository>()));
  gh.singleton<_i16.SettingsCubit>(_i16.SettingsCubit());
  await gh.factoryAsync<_i17.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i18.AuthLocalDataSource>(
      () => _i19.AuthLocalDataSourceImpl(get<_i17.SharedPreferences>()));
  gh.lazySingleton<_i20.AuthRepository>(() => _i21.AuthRepositoryImpl(
      get<_i18.AuthLocalDataSource>(), get<_i4.AuthRemoteDataSource>()));
  gh.singleton<_i22.CacheHelper>(
      _i22.CacheHelperImpl(get<_i17.SharedPreferences>()));
  gh.lazySingleton<_i23.ForgotPasswordUseCase>(
      () => _i23.ForgotPasswordUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i24.GetCurrentUserUseCase>(
      () => _i24.GetCurrentUserUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i25.IsLoggedInUseCase>(
      () => _i25.IsLoggedInUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i26.LoginUseCase>(
      () => _i26.LoginUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i27.LogoutUseCase>(
      () => _i27.LogoutUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i28.PostsLocalDataSource>(
      () => _i29.PostsLocalDataSourceImpl(get<_i17.SharedPreferences>()));
  gh.lazySingleton<_i30.PostsRepository>(() => _i31.PostsRepositoryImpl(
      get<_i13.PostsRemoteDataSource>(),
      get<_i28.PostsLocalDataSource>(),
      get<_i18.AuthLocalDataSource>()));
  gh.lazySingleton<_i32.RegisterUseCase>(
      () => _i32.RegisterUseCase(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i33.AddPostUseCase>(
      () => _i33.AddPostUseCase(get<_i30.PostsRepository>()));
  gh.factory<_i34.AuthCubit>(() => _i34.AuthCubit(
      get<_i32.RegisterUseCase>(),
      get<_i26.LoginUseCase>(),
      get<_i27.LogoutUseCase>(),
      get<_i23.ForgotPasswordUseCase>(),
      get<_i25.IsLoggedInUseCase>(),
      get<_i24.GetCurrentUserUseCase>()));
  gh.lazySingleton<_i35.DeletePostUseCase>(
      () => _i35.DeletePostUseCase(get<_i30.PostsRepository>()));
  gh.lazySingleton<_i36.EditPostUseCase>(
      () => _i36.EditPostUseCase(get<_i30.PostsRepository>()));
  gh.lazySingleton<_i37.GetAllPostsUseCase>(
      () => _i37.GetAllPostsUseCase(get<_i30.PostsRepository>()));
  gh.factory<_i38.PostsCubit>(() => _i38.PostsCubit(
      get<_i33.AddPostUseCase>(),
      get<_i37.GetAllPostsUseCase>(),
      get<_i36.EditPostUseCase>(),
      get<_i35.DeletePostUseCase>()));
  return get;
}

class _$AppModule extends _i39.AppModule {}
