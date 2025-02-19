import 'package:movies_app/features/auth/register/data/models/user_model.dart';

import '../../domain/repositories/register_repo.dart';
import '../data_sources/data_source.dart';

class RegisterRepoImpl implements RegisterRepo {
  DataSource dataSource;

  RegisterRepoImpl(this.dataSource);

  @override
  Future<void> register(UserModel userModel) async {
    try {
      dataSource.register(userModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addUser(UserModel usrModel) async {
    try {
      await dataSource.addUser(usrModel);
    } catch (e) {
      rethrow;
    }
  }
}
