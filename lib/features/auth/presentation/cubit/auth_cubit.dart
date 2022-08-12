import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';
import 'package:social_media_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:social_media_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._registerUseCase,
    this._loginUseCase,
  ) : super(const AuthInitial());

  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;

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
}
