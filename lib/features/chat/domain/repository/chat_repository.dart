import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, Unit>> sendMessage(Message message);

  Future<Either<Failure, List<Message>>> getMessages(String receiverId);
}
