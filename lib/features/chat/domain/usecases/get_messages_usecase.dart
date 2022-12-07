import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/no_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/chat/domain/entities/message.dart';
import 'package:social_media_app/features/chat/domain/repository/chat_repository.dart';

@lazySingleton
class GetMessagesUseCase implements UseCase<List<Message>, NoParams> {
  final ChatRepository _chatRepository;

  const GetMessagesUseCase(this._chatRepository);

  @override
  Future<Either<Failure, List<Message>>> call(NoParams noParams) =>
      _chatRepository.getMessages();
}
