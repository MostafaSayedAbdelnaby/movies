import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class FireBaseManager {
  /// User Collection
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.frmJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  /// Add User
  static Future<void> addUser(UserModel user) {
    var createUser = getUserCollection();
    var userRef = createUser.doc(user.id);
    return userRef.set(user);
  }

  /// Login
  static Future<void> logIn(
      String emailAddress,
      String password,
      Function onLoading,
      Function onSuccess,
      Function onError,
      ) async {
    try {
      onLoading();
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credentials.user!.emailVerified) {
        onSuccess();
      } else {
        onError("email_not_verified");
      }
    } on FirebaseAuthException catch (_) {
      onError("email_or_password_is_not_valid");
    }
  }

  /// Logout
  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}