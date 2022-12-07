import 'package:injectable/injectable.dart';
import 'package:social_media_app/features/chat/data/datasources/remote_datasource/chat_remote_datasource.dart';
import 'package:social_media_app/features/chat/data/models/message_model.dart';

@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Future<void> sendMessage() {
    throw UnimplementedError();
  }

  @override
  Future<List<MessageModel>> getMessages() {
    throw UnimplementedError();
  }
}
