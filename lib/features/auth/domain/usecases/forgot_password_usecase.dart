import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repository.dart';

@lazySingleton
class ForgotPasswordUseCase implements UseCase<Unit, ForgotPasswordParams> {
  final AuthRepository _authRepository;

  const ForgotPasswordUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call(
    ForgotPasswordParams forgotPasswordParams,
  ) =>
      _authRepository.forgotPassword(forgotPasswordParams.email);
}

class ForgotPasswordParams extends AppParams {
  final String email;

  ForgotPasswordParams(this.email);

  @override
  List<Object?> get props => [email];
}
