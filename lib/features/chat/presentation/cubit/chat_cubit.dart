import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/chat/presentation/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatInitial());
}
