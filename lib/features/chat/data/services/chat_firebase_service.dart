import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/constants/firebase_path.dart';
import 'package:social_media_app/features/chat/data/models/message_model.dart';

@lazySingleton
class ChatFirebaseService {
  final _usersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.users);

  final _userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> sendMessage(MessageModel messageModel) async {
    _usersCollection
        .doc(messageModel.senderId)
        .collection(FirebasePath.chats)
        .doc(messageModel.receiverId)
        .collection(FirebasePath.messages)
        .add(messageModel.toJson());
    _usersCollection
        .doc(messageModel.receiverId)
        .collection(FirebasePath.chats)
        .doc(messageModel.senderId)
        .collection(FirebasePath.messages)
        .add(messageModel.toJson());
  }

  Future<List<MessageModel>> getMessages({required String receiverId}) async {
    List<MessageModel> messages = [];
    _usersCollection
        .doc(_userId)
        .collection(FirebasePath.chats)
        .doc(receiverId)
        .collection(FirebasePath.messages)
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.map((queryDocSnapshot) {
        messages.add(MessageModel.fromJson(queryDocSnapshot.data()));
      }).toList();
    });
    return messages;
  }
}
