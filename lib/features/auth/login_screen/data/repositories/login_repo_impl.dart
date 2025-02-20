import 'package:movies_app/features/auth/login_screen/data/data_source/login_data_source.dart';

import '../../domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  LoginDataSource loginDataSource ;
  LoginRepoImpl(this.loginDataSource);

  @override
  Future<void> login({required String email, required String password})async {
    try {
      await loginDataSource.login(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}