import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/entities/user.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/auth/domain/repository/auth_repository.dart';

@lazySingleton
class GetCurrentUserUseCase implements UseCase<User, NoParams> {
  final AuthRepository _authRepository;

  const GetCurrentUserUseCase(this._authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams noParams) =>
      _authRepository.getCurrentUser();
}
