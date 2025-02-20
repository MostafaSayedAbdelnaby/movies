import '../../data/model/update_user_model.dart';

abstract class UpdateRepo {
  Future<void> updateUser(UpdateUserModel updateUserModel);
}
