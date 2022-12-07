import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, Unit>> sendMessage();

  Future<Either<Failure, List<Message>>> getMessages();
}
