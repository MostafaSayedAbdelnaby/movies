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
    print("*********************************************************************************************************");
    print(credential.uid);
    try {
      await ref.update(updateUserModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser() async {
    try{
      var useId=FirebaseAuth.instance.currentUser?.uid;
      await FirebaseAuth.instance.currentUser?.delete();
      await FirebaseFirestore.instance.collection("Users").doc(useId).delete();
    }catch(e){
      rethrow;
    }
  }
}
