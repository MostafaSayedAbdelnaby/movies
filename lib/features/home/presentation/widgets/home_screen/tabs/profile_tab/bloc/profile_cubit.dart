// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:movies_app/features/home/presentation/widgets/home_screen/tabs/profile_tab/bloc/profile_state.dart';
// import '../../../../../../../auth/data/models/user_model.dart';
// import '../../../../../../../auth/fire_base/fire_base_manager.dart';
// import '../../../../../../../auth/register/data/models/user_model.dart';
//
// class ProfileCubit extends Cubit<ProfileStates> {
//   ProfileCubit() : super(UserDataInitial());
//   UserModel? userModel;
//   UserModel? userData;
//   User? currentUser;
//
//   ///Logout
//   Future<void> logOut() async {
//     await FirebaseAuth.instance.signOut();
//   }
//
//   /// Delete User
//   Future<void> deleteUser() async {
//     await FirebaseAuth.instance.currentUser?.delete();
//   }
//
//   intUser() async {
//     currentUser = FirebaseAuth.instance.currentUser;
//     userModel = await getUser(currentUser?.uid ?? '');
//     emit(state);
//   }
//
//   /// get User Data
//   getUser(String userId) async {
//     try {
//       emit(UserDataLoadingState());
//       var getUserData = FireBaseManager.getUserCollection();
//       DocumentSnapshot<UserModel> userResponse =
//           await getUserData.doc(userId).get();
//       userData = userResponse.data();
//       if (userData != null) {
//         emit(UserDataSuccessState());
//         return userData;
//       } else {
//         emit(UserDataErrorState("something went wrong"));
//       }
//     } catch (e) {
//       emit(UserDataErrorState("something went wrong"));
//     }
//   }
//
//   ///Update UserData
//   updateUserData(UserModel model, String? userId) async {
//     try {
//       emit(UpdateDataUserLoadingState());
//       var updateUserData = FireBaseManager.getUserCollection();
//       updateUserData.doc(userId).update(model.toJson());
//       emit(UpdateDataUserSuccessState());
//     } catch (e) {
//       emit(UpdateDataUserErrorState("something went wrong"));
//     }
//   }
//
//   /// Delete User Data
//   deleteUserData(String? userId) {
//     var deleteUser = FireBaseManager.getUserCollection();
//     return deleteUser.doc(userId).delete();
//   }
// }
