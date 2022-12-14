import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/chat/domain/entities/chat/chat.dart';
import 'package:social_media_app/features/chat/domain/repository/chat_repository.dart';

@lazySingleton
class GetChatsUseCase implements UseCase<List<Chat>, NoParams> {
  final ChatRepository _chatRepository;

  const GetChatsUseCase(this._chatRepository);

  @override
  Future<Either<Failure, List<Chat>>> call(
    NoParams noParams,
  ) =>
      _chatRepository.getChats();
}
