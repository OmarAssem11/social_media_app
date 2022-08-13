import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';
import 'package:social_media_app/features/posts/domain/repository/posts_repository.dart';

@lazySingleton
class AddPostUseCase implements UseCase<Unit, AddPostParams> {
  final PostsRepository _postsRepository;

  const AddPostUseCase(this._postsRepository);

  @override
  Future<Either<Failure, Unit>> call(AddPostParams addPostParams) =>
      _postsRepository.addPost(addPostParams.post);
}

class AddPostParams extends AppParams {
  final Post post;

  AddPostParams(this.post);

  @override
  List<Object?> get props => [post];
}
