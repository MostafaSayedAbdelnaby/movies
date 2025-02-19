// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../data/models/user_model.dart';
//
// class FireBaseManager {
//   /// User Collection
//   static CollectionReference<UserModel> getUserCollection() {
//     return FirebaseFirestore.instance
//         .collection("Users")
//         .withConverter<UserModel>(
//       fromFirestore: (snapshot, _) {
//         return UserModel.fromJson(snapshot.data()!);
//       },
//       toFirestore: (value, _) {
//         return value.toJson();
//       },
//     );
//   }
//
//   /// Add User
//   Future<void> addUser(UserModel user) {
//     var createUser = getUserCollection();
//     var userRef = createUser.doc(user.id);
//     return userRef.set(user);
//   }
// }
