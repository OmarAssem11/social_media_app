import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';
import 'package:social_media_app/features/chat/domain/repository/chat_repository.dart';

@lazySingleton
class SendMessageUseCase implements UseCase<Unit, SendMessageParams> {
  final ChatRepository _chatRepository;

  const SendMessageUseCase(this._chatRepository);

  @override
  Future<Either<Failure, Unit>> call(SendMessageParams sendMessageParams) =>
      _chatRepository.sendMessage(sendMessageParams.message);
}

class SendMessageParams extends AppParams {
  final Message message;

  SendMessageParams({required this.message});

  @override
  List<Object?> get props => [message];
}
