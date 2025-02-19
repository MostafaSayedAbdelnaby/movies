import '../models/user_model.dart';

abstract class DataSource {
  Future<void> addUser(UserModel user);
  // Future<UserModel> getUser(String userId);
  /// register User
  Future<void> register(UserModel userModel);

  // Future<void> readUserData(String id);
  //
  // Future<void> createUser(
  //   String email,
  //   String password,
  //   String name,
  //   String phoneNumber,
  //   int indexOfImage,
  //   Function onSuccess,
  //   Function onLoading,
  //   Function onError,
  // );
  //
  // Future<void> logIn(
  //   String emailAddress,
  //   String password,
  //   Function onLoading,
  //   Function onError,
  //   Function onSuccess,
  // );
  //
  // Future<void> logOut();
}



// void onLoading({String? message});
//
// void onError({String? message});
//
// void onSuccess();
//
// @override
// void onError({String? message}) {
//   Navigator.pop(context); // to return after onError
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text("Something went wrong"),
//       content: Text(message ?? ""),
//       actions: [
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text("Ok"),
//         )
//       ],
//     ),
//   );
// }
//
// @override
// void onLoading({String? message}) {
//   showDialog(
//     context: context,
//     builder: (context) => const AlertDialog(
//         title: Center(child: CircularProgressIndicator()),
//         backgroundColor: Colors.transparent),
//   );
// }
//
// @override
// void onSuccess() {
//   Navigator.pop(context);
//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text("Successfully"),
//       actions: [
//         ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text("Ok"),
//         )
//       ],
//     ),
//   );
// }