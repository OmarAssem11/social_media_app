import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/exceptions/app_exception.dart';
import 'package:social_media_app/core/domain/failure/failure.dart';
import 'package:social_media_app/core/domain/failure/return_failure.dart';
import 'package:social_media_app/features/chat/data/datasources/remote_datasource/chat_remote_datasource.dart';
import 'package:social_media_app/features/chat/data/mappers/chat_mapper/chat_model_mapper.dart';
import 'package:social_media_app/features/chat/data/mappers/message_mapper/message_mapper.dart';
import 'package:social_media_app/features/chat/data/mappers/message_mapper/message_model_mapper.dart';
import 'package:social_media_app/features/chat/domain/entities/chat/chat.dart';
import 'package:social_media_app/features/chat/domain/entities/message/message.dart';
import 'package:social_media_app/features/chat/domain/repository/chat_repository.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _chatRemoteDataSource;

  const ChatRepositoryImpl(this._chatRemoteDataSource);

  @override
  Future<Either<Failure, List<Chat>>> getChats() async {
    try {
      final chatsModels = await _chatRemoteDataSource.getChats();
      final chats =
          chatsModels.map((chatModel) => chatModel.fromModel).toList();
      return right(chats);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage(Message message) async {
    try {
      await _chatRemoteDataSource.sendMessage(message.toModel);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, List<Message>>> getMessages(String receiverId) async {
    try {
      final messagesModels =
          await _chatRemoteDataSource.getMessages(receiverId);
      final messages =
          messagesModels.map((messageModel) => messageModel.fromModel).toList();
      return right(messages);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
