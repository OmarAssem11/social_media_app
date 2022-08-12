import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/core/data/constants/constants.dart';
import 'package:social_media_app/core/data/models/user_model.dart';
import 'package:social_media_app/features/auth/data/models/login_model/login_model.dart';
import 'package:social_media_app/features/auth/data/models/register_model/register_model.dart';

class AuthFirebaseService {
  Future<UserModel> register(RegisterModel registerModel) async {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerModel.email,
      password: registerModel.password,
    );
    final uId = userCredential.user!.uid;
    final userModel = UserModel(
      id: uId,
      firstName: registerModel.firstName,
      lastName: registerModel.lastName,
      email: registerModel.email,
      password: registerModel.password,
    );
    await FirebaseFirestore.instance
        .collection(Constants.usersCollectionPath)
        .doc(uId)
        .set(userModel.toJson());
    return userModel;
  }

  Future<UserModel> login(LoginModel loginModel) async {
    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginModel.email,
      password: loginModel.password,
    );
    final uId = userCredential.user!.uid;
    final documentSnapShot = await FirebaseFirestore.instance
        .collection(Constants.usersCollectionPath)
        .doc(uId)
        .get();
    final userModel = UserModel.fromJson(documentSnapShot.data()!);
    return userModel;
  }
}
