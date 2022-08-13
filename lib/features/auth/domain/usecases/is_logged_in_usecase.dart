import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repository.dart';

@lazySingleton
class IsLoggedInUseCase implements UseCase<bool, NoParams> {
  final AuthRepository _authRepository;

  const IsLoggedInUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams noParams) =>
      _authRepository.isLoggedIn();
}
