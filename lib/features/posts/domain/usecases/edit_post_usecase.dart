import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';
import 'package:social_media_app/features/posts/domain/repository/posts_repository.dart';

@lazySingleton
class EditPostUseCase implements UseCase<Unit, EditPostParams> {
  final PostsRepository _postsRepository;

  const EditPostUseCase(this._postsRepository);

  @override
  Future<Either<Failure, Unit>> call(EditPostParams editPostParams) =>
      _postsRepository.editPost(editPostParams.post);
}

class EditPostParams extends AppParams {
  final Post post;

  EditPostParams(this.post);

  @override
  List<Object?> get props => [post];
}
