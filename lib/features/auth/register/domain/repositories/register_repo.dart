import 'package:movies_app/features/auth/register/data/models/user_model.dart';

abstract class RegisterRepo{
  // Future<void> logIn(
  //     String emailAddress,
  //     String password,
  //     Function onLoading,
  //     Function onError,
  //     Function onSuccess,
  //     );

  Future<void> register(
      UserModel userModel
      // Function onLoading,
      // Function onError,
      // Function onSuccess,
      );

  Future<void> addUser (UserModel usrModel);

}