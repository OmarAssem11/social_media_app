import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/features/chat/domain/entities/message.dart';
import 'package:social_media_app/features/chat/domain/repository/chat_repository.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  @override
  Future<Either<Failure, Unit>> sendMessage() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Message>>> getMessages() {
    throw UnimplementedError();
  }
}
