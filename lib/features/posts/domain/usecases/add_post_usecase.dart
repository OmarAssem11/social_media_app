import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/posts/domain/repository/posts_repository.dart';

@lazySingleton
class AddPostUseCase implements UseCase<Unit, AddPostParams> {
  final PostsRepository _postsRepository;

  const AddPostUseCase(this._postsRepository);

  @override
  Future<Either<Failure, Unit>> call(AddPostParams addPostParams) =>
      _postsRepository.addPost(
        text: addPostParams.text,
        imageFile: addPostParams.imageFile,
      );
}

class AddPostParams extends AppParams {
  final String text;
  final File? imageFile;

  AddPostParams({
    required this.text,
    required this.imageFile,
  });

  @override
  List<Object?> get props => [
        text,
        imageFile,
      ];
}
