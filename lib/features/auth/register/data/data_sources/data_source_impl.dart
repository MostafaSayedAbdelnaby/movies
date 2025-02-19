import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      UserModel model = UserModel(
        name: userModel.name,
        email: userModel.email,
        id: credential.user!.uid,
        phoneNumber: userModel.phoneNumber,
        indexOfImage: userModel.indexOfImage,
        password: userModel.password,
      );
      // Save user data in Firestore & set data for document
      await addUser(model);
      // credential.user!.sendEmailVerification(); // ***
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Add User
  @override
  Future<void> addUser(UserModel userModel) async {
    // var createUser = getUserCollection();
    // var userRef = createUser.doc(user.id);
    var collection = FirebaseFirestore.instance.collection("Users");
    try {
      var ref = collection.doc();
      userModel.id = ref.id;
      await ref.set(userModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

// /// Read User Data
// @override
// Future<UserModel?> readUserData(String id) async {
//   var collection = getUserCollection();
//   DocumentSnapshot<UserModel> snapshot = await collection.doc(id).get();
//   return snapshot.data();
// }
//
// /// Create User
// @override
// Future<void> createUser(
//   String email,
//   String password,
//   String name,
//   String phoneNumber,
//   int indexOfImage,
//   Function onLoading,
//   Function onError,
//   Function onSuccess,
// ) async {
//   try {
//     onLoading(); // call back Function , it acts in RegisterScreen
//
//     final credential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     UserModel model = UserModel(
//       id: credential.user!.uid,
//       // Use UID from Firebase Authentication
//       email: email,
//       name: name,
//       // createdAt: DateTime.now().millisecondsSinceEpoch,
//       phoneNumber: phoneNumber,
//       indexOfImage: indexOfImage,
//     );
//     await addUser(model); // Save user data to Firestore
//     onSuccess(); // call back Function
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//       onError(e.message!); // call back Function with message
//       print('The password provided is too weak.');
//     } else if (e.code == 'email-already-in-use') {
//       onError(e.message!); // call back Function with message
//       print('The account already exists for that email.');
//     }
//   } catch (e) {
//     onError(
//         "Something went wrong"); // call back Function with a default message
//     print(e);
//   }
// }
//
// /// Login
// @override
// Future<void> logIn(
//   String emailAddress,
//   String password,
//   Function onLoading,
//   Function onSuccess,
//   Function onError,
// ) async {
//   try {
//     onLoading();
//     final credentials = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: emailAddress, password: password);
//     if (credentials.user!.emailVerified) {
//       onSuccess();
//     } else {
//       onError("email_not_verified");
//     }
//   } on FirebaseAuthException catch (_) {
//     onError("email_or_password_is_not_valid");
//   }
// }
//
// /// Logout
// @override
// Future<void> logOut() async {
//   return FirebaseAuth.instance.signOut();
// }
//
// @override
// Future<UserModel> getUser(String userId) {
//   // TODO: implement getUser
//   throw UnimplementedError();
// }
}
