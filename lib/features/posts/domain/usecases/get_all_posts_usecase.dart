import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/posts/domain/entities/post.dart';
import 'package:social_media_app/features/posts/domain/repository/posts_repository.dart';

@lazySingleton
class GetAllPostsUseCase implements UseCase<List<Post>, NoParams> {
  final PostsRepository _postsRepository;

  const GetAllPostsUseCase(this._postsRepository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams noParams) =>
      _postsRepository.getAllPosts();
}
