import 'package:movies_app/features/auth/update_profile_screen/data/update_data_source/update_data_source.dart';

import '../../domain/repositories/update_repo.dart';
import '../model/update_user_model.dart';

class UpdateRepoImpl implements UpdateRepo{
  UpdateDataSource updateDataSource;
  UpdateRepoImpl(this.updateDataSource);

  @override
  Future<void> updateUser(UpdateUserModel updateUserModel) async {
    try{
      await updateDataSource.updateUser(updateUserModel);
    }catch(e){
      rethrow;
    }
  }

}