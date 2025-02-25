import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/update_data_source/update_data_source.dart';

import '../model/update_user_model.dart';

class UpdateDataSourceImpl implements UpdateDataSource {
  @override
  Future<void> updateUser(UpdateUserModel updateUserModel) async {
    var collection = FirebaseFirestore.instance.collection("Users");
    var credential = FirebaseAuth.instance.currentUser;
    var ref = collection.doc(credential!.uid);
    // print("**************************************");
    // print(credential.uid);
    try {
      await ref.update(updateUserModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      var useId =
          FirebaseAuth.instance.currentUser?.uid; // get idOfUserData = idOfUser
      await FirebaseAuth.instance.currentUser?.delete(); // delete User
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(useId)
          .delete(); // delete UserData
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  // @override
  // getUser(String id) async {
  //
  //   // var getUserData = FireBaseManager.getUserCollection();
  //   // DocumentSnapshot<UserModel> userResponse = await getUserData.doc(id).get();
  //   // userData = userResponse.data();
  //
  //   try {
  //     var ref =
  //         await FirebaseFirestore.instance.collection("Users").doc(id).get();
  //     // if (ref.exists) {
  //     // UpdateUserModel.fromJson(ref.data()!);
  //     var response = UpdateUserModel.fromJson(ref.data()!);
  //      return response;
  //     // }
  //     // return null; // User not found
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<UpdateUserModel?> getUser() async {
    var currentUser = FirebaseAuth.instance.currentUser; // Get current user

    try {
      var ref = await FirebaseFirestore.instance.collection("Users").doc(currentUser?.uid).get();
      if (ref.exists) {
        return UpdateUserModel.fromJson(ref.data()!);
      } else {
        return null; // User not found
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<DocumentSnapshot> getUserData(String uid) async {
  //   return await FirebaseFirestore.instance.collection('users').doc(uid).get();
  // }

// @override
// Future<UpdateUserModel?> getUser(String id) async{
//   // var useId =
//   //     FirebaseAuth.instance.currentUser?.uid;
//   try{
//     var ref = await FirebaseFirestore.instance
//         .collection("Users")
//         .doc(id).get();
//     return ref.data(UpdateUserModel.fromJson());
//   }catch (e){
//     rethrow;
//   }
// }

}
