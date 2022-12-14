// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../core/data/datasources/cache_helper.dart' as _i23;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i19;
import '../features/auth/data/datasources/local_datasource/auth_local_datasource_impl.dart'
    as _i20;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/data/datasources/remote_datasource/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i22;
import '../features/auth/data/services/auth_firebase_service.dart' as _i3;
import '../features/auth/domain/repository/auth_repository.dart' as _i21;
import '../features/auth/domain/usecases/forgot_password_usecase.dart' as _i25;
import '../features/auth/domain/usecases/get_current_user_usecase.dart' as _i26;
import '../features/auth/domain/usecases/is_logged_in_usecase.dart' as _i27;
import '../features/auth/domain/usecases/login_usecase.dart' as _i28;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i29;
import '../features/auth/domain/usecases/register_usecase.dart' as _i34;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i36;
import '../features/chat/data/datasources/remote_datasource/chat_remote_datasource.dart'
    as _i7;
import '../features/chat/data/datasources/remote_datasource/chat_remote_datasource_impl.dart'
    as _i8;
import '../features/chat/data/repository/chat_repository_impl.dart' as _i10;
import '../features/chat/data/services/chat_firebase_service.dart' as _i6;
import '../features/chat/domain/repository/chat_repository.dart' as _i9;
import '../features/chat/domain/usecases/get_chats_usecase.dart' as _i11;
import '../features/chat/domain/usecases/get_messages_usecase.dart' as _i12;
import '../features/chat/domain/usecases/send_message_usecase.dart' as _i16;
import '../features/chat/presentation/cubit/chat_cubit.dart' as _i24;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource.dart'
    as _i30;
import '../features/posts/data/datasources/local_datasource/posts_local_datasource_impl.dart'
    as _i31;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource.dart'
    as _i14;
import '../features/posts/data/datasources/remote_datasource/posts_remote_datasource_impl.dart'
    as _i15;
import '../features/posts/data/repository/posts_repository_impl.dart' as _i33;
import '../features/posts/data/services/posts_firebase_service.dart' as _i13;
import '../features/posts/domain/repository/posts_repository.dart' as _i32;
import '../features/posts/domain/usecases/add_post_usecase.dart' as _i35;
import '../features/posts/domain/usecases/delete_post_usecase.dart' as _i37;
import '../features/posts/domain/usecases/edit_post_usecase.dart' as _i38;
import '../features/posts/domain/usecases/get_all_posts_usecase.dart' as _i39;
import '../features/posts/presentation/cubit/posts_cubit.dart' as _i40;
import '../features/settings/presentation/cubit/settings_cubit.dart' as _i17;
import 'app_module.dart' as _i41; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.GetChatsUseCase>(
      () => _i11.GetChatsUseCase(get<_i9.ChatRepository>()));
  gh.lazySingleton<_i12.GetMessagesUseCase>(
      () => _i12.GetMessagesUseCase(get<_i9.ChatRepository>()));
  gh.lazySingleton<_i13.PostsFirebaseService>(
      () => _i13.PostsFirebaseService());
  gh.lazySingleton<_i14.PostsRemoteDataSource>(
      () => _i15.PostsRemoteDataSourceImpl(get<_i13.PostsFirebaseService>()));
  gh.lazySingleton<_i16.SendMessageUseCase>(
      () => _i16.SendMessageUseCase(get<_i9.ChatRepository>()));
  gh.singleton<_i17.SettingsCubit>(_i17.SettingsCubit());
  await gh.factoryAsync<_i18.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i19.AuthLocalDataSource>(
      () => _i20.AuthLocalDataSourceImpl(get<_i18.SharedPreferences>()));
  gh.lazySingleton<_i21.AuthRepository>(() => _i22.AuthRepositoryImpl(
      get<_i19.AuthLocalDataSource>(), get<_i4.AuthRemoteDataSource>()));
  gh.singleton<_i23.CacheHelper>(
      _i23.CacheHelperImpl(get<_i18.SharedPreferences>()));
  gh.factory<_i24.ChatCubit>(() => _i24.ChatCubit(get<_i11.GetChatsUseCase>(),
      get<_i16.SendMessageUseCase>(), get<_i12.GetMessagesUseCase>()));
  gh.lazySingleton<_i25.ForgotPasswordUseCase>(
      () => _i25.ForgotPasswordUseCase(get<_i21.AuthRepository>()));
  gh.lazySingleton<_i26.GetCurrentUserUseCase>(
      () => _i26.GetCurrentUserUseCase(get<_i21.AuthRepository>()));
  gh.lazySingleton<_i27.IsLoggedInUseCase>(
      () => _i27.IsLoggedInUseCase(get<_i21.AuthRepository>()));
  gh.lazySingleton<_i28.LoginUseCase>(
      () => _i28.LoginUseCase(get<_i21.AuthRepository>()));
  gh.lazySingleton<_i29.LogoutUseCase>(
      () => _i29.LogoutUseCase(get<_i21.AuthRepository>()));
  gh.lazySingleton<_i30.PostsLocalDataSource>(
      () => _i31.PostsLocalDataSourceImpl(get<_i18.SharedPreferences>()));
  gh.lazySingleton<_i32.PostsRepository>(() => _i33.PostsRepositoryImpl(
      get<_i14.PostsRemoteDataSource>(),
      get<_i30.PostsLocalDataSource>(),
      get<_i19.AuthLocalDataSource>()));
  gh.lazySingleton<_i34.RegisterUseCase>(
      () => _i34.RegisterUseCase(get<_i21.AuthRepository>()));
  gh.lazySingleton<_i35.AddPostUseCase>(
      () => _i35.AddPostUseCase(get<_i32.PostsRepository>()));
  gh.factory<_i36.AuthCubit>(() => _i36.AuthCubit(
      get<_i34.RegisterUseCase>(),
      get<_i28.LoginUseCase>(),
      get<_i29.LogoutUseCase>(),
      get<_i25.ForgotPasswordUseCase>(),
      get<_i27.IsLoggedInUseCase>(),
      get<_i26.GetCurrentUserUseCase>()));
  gh.lazySingleton<_i37.DeletePostUseCase>(
      () => _i37.DeletePostUseCase(get<_i32.PostsRepository>()));
  gh.lazySingleton<_i38.EditPostUseCase>(
      () => _i38.EditPostUseCase(get<_i32.PostsRepository>()));
  gh.lazySingleton<_i39.GetAllPostsUseCase>(
      () => _i39.GetAllPostsUseCase(get<_i32.PostsRepository>()));
  gh.factory<_i40.PostsCubit>(() => _i40.PostsCubit(
      get<_i35.AddPostUseCase>(),
      get<_i39.GetAllPostsUseCase>(),
      get<_i38.EditPostUseCase>(),
      get<_i37.DeletePostUseCase>()));
  return get;
}

class _$AppModule extends _i41.AppModule {}
