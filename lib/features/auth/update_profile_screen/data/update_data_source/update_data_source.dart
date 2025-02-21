import 'package:movies_app/features/auth/update_profile_screen/data/model/update_user_model.dart';

abstract class UpdateDataSource {
  Future<void> updateUser(UpdateUserModel updateUserModel);

  Future<void> deleteUser();

  Future<void> logOutUser();

  getUser(String id);


}
