import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
class Message with _$Message {
  const factory Message({
    @Default('') String senderId,
    @Default('') String receiverId,
    required String text,
    required DateTime dateTime,
  }) = _Message;
}
