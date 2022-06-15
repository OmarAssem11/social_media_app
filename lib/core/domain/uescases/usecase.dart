import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
