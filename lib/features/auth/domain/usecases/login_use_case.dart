import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/auth/domain/entities/login_entity.dart';
import 'package:social_media_app/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class LoginUseCase implements UseCase<Unit, LoginParams> {
  final AuthRepository _authRepository;

  const LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call(LoginParams loginParams) =>
      _authRepository.login(loginParams.loginEntity);
}

class LoginParams extends AppParams {
  final LoginEntity loginEntity;

  LoginParams(this.loginEntity);

  @override
  List<Object?> get props => [loginEntity];
}
