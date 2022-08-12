import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository _authRepository;

  const LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) =>
      _authRepository.logout();
}
