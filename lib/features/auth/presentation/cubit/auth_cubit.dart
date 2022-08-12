import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';
import 'package:social_media_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:social_media_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._loginUseCase,
  ) : super(const AuthInitial());

  final LoginUseCase _loginUseCase;

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
