import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/params/app_params.dart';
import 'package:social_media_app/core/domain/usecases/usecase.dart';
import 'package:social_media_app/features/chat/domain/entities/message.dart';
import 'package:social_media_app/features/chat/domain/repository/chat_repository.dart';

@lazySingleton
class GetMessagesUseCase implements UseCase<List<Message>, GetMessagesParams> {
  final ChatRepository _chatRepository;

  const GetMessagesUseCase(this._chatRepository);

  @override
  Future<Either<Failure, List<Message>>> call(
    GetMessagesParams getMessagesParams,
  ) =>
      _chatRepository.getMessages(getMessagesParams.receiverId);
}

class GetMessagesParams extends AppParams {
  final String receiverId;

  GetMessagesParams({required this.receiverId});

  @override
  List<Object?> get props => [receiverId];
}
