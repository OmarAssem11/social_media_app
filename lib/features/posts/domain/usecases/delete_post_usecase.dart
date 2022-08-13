import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/posts/domain/repository/posts_repository.dart';

@lazySingleton
class DeletePostUseCase implements UseCase<Unit, DeletePostParams> {
  final PostsRepository _postsRepository;

  const DeletePostUseCase(this._postsRepository);

  @override
  Future<Either<Failure, Unit>> call(DeletePostParams deletePostParams) =>
      _postsRepository.deletePost(deletePostParams.postId);
}

class DeletePostParams extends AppParams {
  final int postId;

  DeletePostParams(this.postId);

  @override
  List<Object?> get props => [postId];
}
