import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/auth/login_screen/data/data_source/login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<void> login({required String email, required String password}) async {
    /// Login
    @override
    Future<void> login({
      required String email,
      required String password,
    }) async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } catch (e) {
        rethrow;
      }
    }
  }
}
