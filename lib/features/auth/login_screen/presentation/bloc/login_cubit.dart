import 'package:bloc/bloc.dart';
import 'package:movies_app/features/auth/login_screen/domain/repositories/login_repo.dart';
import 'package:movies_app/features/auth/login_screen/presentation/bloc/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  // Login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginOnLoadingState());
    try {
      await loginRepo.login(email: email, password: password);
      emit(LoginOnSuccessState());
    } catch (e) {
      emit(LoginOnErrorState(e.toString()));
    }
  }
}
