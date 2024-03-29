import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';
import 'package:social_media_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:social_media_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:social_media_app/features/auth/domain/usecases/is_logged_in_usecase.dart';
import 'package:social_media_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:social_media_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:social_media_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._registerUseCase,
    this._loginUseCase,
    this._logoutUseCase,
    this._forgotPasswordUseCase,
    this._isLoggedInUseCase,
    this._getCurrentUserUseCase,
  ) : super(const AuthInitial());

  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final IsLoggedInUseCase _isLoggedInUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  Future<void> register(RegisterEntity registerEntity) async {
    emit(const AuthLoading());
    final result = await _registerUseCase(
      RegisterParams(registerEntity),
    );
    emit(
      result.fold(
        (failure) => const AuthError(),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> login(LoginEntity loginEntity) async {
    emit(const AuthLoading());
    final result = await _loginUseCase(LoginParams(loginEntity));
    emit(
      result.fold(
        (failure) => const AuthError(),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logoutUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const AuthError(),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> forgotPassword(String email) async {
    emit(const AuthLoading());
    final result = await _forgotPasswordUseCase(ForgotPasswordParams(email));
    emit(
      result.fold(
        (failure) => const AuthError(),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> isLoggedIn() async {
    emit(const AuthLoading());
    final result = await _isLoggedInUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const AuthError(),
        (isLoggedIn) {
          return isLoggedIn ? const IsLoggedIn() : const NotLoggedIn();
        },
      ),
    );
  }

  Future<void> getCurrentUser() async {
    emit(const AuthLoading());
    final result = await _getCurrentUserUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const AuthError(),
        (user) => CurrentUser(user),
      ),
    );
  }
}
