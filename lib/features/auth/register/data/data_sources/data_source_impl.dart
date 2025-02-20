import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_model.dart';
import 'data_source.dart';

class DataSourceImpl implements DataSource {
  /// User Collection
  CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  /// Register
  @override
  Future<void> register(UserModel userModel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      userModel.id = credential.user!.uid;
      // Save user data in Firestore & set data for document
      await addUser(userModel);
      credential.user!.sendEmailVerification(); // ***
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Add User
  @override
  Future<void> addUser(UserModel userModel) async {
    var collection = FirebaseFirestore.instance.collection("Users");
    try {
      var ref = collection.doc(userModel.id);
      // userModel.id = ref.id;
      await ref.set(userModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }



  // signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser == null) {
  //       return; // The user canceled the sign-in
  //     }
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     // Create a new credential
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Once signed in, return the UserCredential
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //     if (userCredential.user != null) {
  //       UserModel userModel = UserModel(
  //           email: userCredential.user!.email ?? "",
  //           name: userCredential.user!.displayName ?? "",
  //           indexOfImage: userCredential.user!.photoURL ?? "",
  //           id: userCredential.user!.uid,
  //           phoneNumber: userCredential.user!.phoneNumber ?? "");
  //       await addUser(userModel);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }


// /// Read User Data
// @override
// Future<UserModel?> readUserData(String id) async {
//   var collection = getUserCollection();
//   DocumentSnapshot<UserModel> snapshot = await collection.doc(id).get();
//   return snapshot.data();
// }


// on FirebaseAuthException catch (e) {
// String errorMessage = '';
// if (e.code == 'wrong-password') {
// errorMessage = "something_went_wrong";
// } else if (e.code == 'user-not-found') {
// errorMessage = "something_went_wrong";
// } else if (e.code == 'email-already-in-use') {
// errorMessage = "something_went_wrong";
// } else if (e.code == 'invalid-email') {
// errorMessage = "something_went_wrong";
// } else if (e.code == 'network-request-failed') {
// errorMessage = "something_went_wrong";
// } else {
// errorMessage = "something_went_wrong";
// }
// }
}
