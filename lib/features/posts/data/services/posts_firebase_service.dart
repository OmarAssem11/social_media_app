import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/constants/constants.dart';
import 'package:social_media_app/features/posts/data/models/post_model.dart';

@lazySingleton
class PostsFirebaseService {
  final postsCollection =
      FirebaseFirestore.instance.collection(Constants.postsCollectionPath);

  Future<void> addPost(PostModel postModel) =>
      postsCollection.doc().set(postModel.toJson());

  Future<List<PostModel>> getAllPosts() async {
    final querySnapshot = await postsCollection.get();
    final postModels = querySnapshot.docs.map(
      (queryDocumentSnapshot) {
        final json = queryDocumentSnapshot.data()
          ..['id'] = queryDocumentSnapshot.id;
        return PostModel.fromJson(json);
      },
    ).toList();
    return postModels;
  }

  Future<void> editPost(PostModel postModel) =>
      postsCollection.doc(postModel.id).update(postModel.toJson());

  Future<void> deletePost(String postId) =>
      postsCollection.doc(postId).delete();

  Future<String> uploadImage(File imageFile) async {
    final path =
        '${Constants.postImagesStoragePath}${Uri.file(imageFile.path).pathSegments.last}';
    final taskSnapshot =
        await FirebaseStorage.instance.ref().child(path).putFile(imageFile);
    return taskSnapshot.ref.getDownloadURL();
  }
}
