import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/features/auth/domain/entities/register_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> register({
    required RegisterEntity registerEntity,
  });
}
