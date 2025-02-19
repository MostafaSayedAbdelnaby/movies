import 'package:bloc/bloc.dart';
import 'package:movies_app/features/auth/register/data/models/user_model.dart';
import 'package:movies_app/features/auth/register/domain/repositories/register_repo.dart';
import 'package:movies_app/features/auth/register/presentation/bloc/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());
  RegisterRepo registerRepo;

  // Future<void> login(
  //   String emailAddress,
  //   String password,
  // ) async {
  //   try {
  //     emit(LoginOnLoadingState());
  //     final credentials = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: emailAddress, password: password);
  //     if (credentials.user!.emailVerified) {
  //       emit(LoginOnSuccessState());
  //     } else {
  //       emit(LoginOnErrorState("email is not verified"));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "password is wrong") {
  //       emit(LoginOnErrorState("password is wrong"));
  //       // print(e.code);
  //     } else if (e.code == "user is not found") {
  //       emit(LoginOnErrorState("user is not found"));
  //       // print("user-not-found");
  //     } else {
  //       emit(LoginOnErrorState("email or password are not correct"));
  //     }
  //   }
  // }

  addUser(UserModel userModel) async {
    emit(RegisterOnLoadingState());
    try {
      await registerRepo.addUser(userModel);
      emit(RegisterOnSuccessState());
    } catch (e) {
      emit(RegisterOnErrorState(e.toString()));
    }
  }
}
