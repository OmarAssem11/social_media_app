import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:social_media_app/core/data/constants/firebase_path.dart';
import 'package:social_media_app/features/posts/data/models/post_model.dart';

@lazySingleton
class PostsFirebaseService {
  final _postsCollection =
      FirebaseFirestore.instance.collection(FirebasePath.posts);

  Future<void> addPost(PostModel postModel) =>
      _postsCollection.doc().set(postModel.toJson());

  Future<List<PostModel>> getAllPosts() async {
    final querySnapshot = await _postsCollection.get();
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
      _postsCollection.doc(postModel.id).update(postModel.toJson());

  Future<void> deletePost(String postId) =>
      _postsCollection.doc(postId).delete();

  Future<String> uploadImage(File imageFile) async {
    final path =
        '${FirebasePath.postImages}${Uri.file(imageFile.path).pathSegments.last}';
    final taskSnapshot =
        await FirebaseStorage.instance.ref().child(path).putFile(imageFile);
    return taskSnapshot.ref.getDownloadURL();
  }
}
