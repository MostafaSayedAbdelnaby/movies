import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/auth/update_profile_screen/domain/repositories/update_repo.dart';
import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/user_data_states.dart';
import '../../data/model/update_user_model.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UpdateRepo updateRepo;
  UpdateUserModel? updateUserModel;
  User? currentUser;

  UserDataCubit({required this.updateRepo}) : super(UserDataInitial());

  /// update User
  Future<void> updateUser(UpdateUserModel updateUserModel) async {
    emit(UpdateOnLoadingStates());
    try {
      await updateRepo.updateUser(updateUserModel);
      emit(UpdateOnSuccessStates());
    } catch (e) {
      emit(UpdateOnErrorStates(e.toString()));
    }
  }

  // /// get User
  // getUser(String id) async {
  //   emit(UserDataLoadingStates());
  //   try {
  //     await updateRepo.getUser(id);
  //     emit(UserDataSuccessStates());
  //   } catch (e) {
  //     emit(UserDataErrorStates(e.toString()));
  //   }
  // }

  /// get User
  Future<void> getUser(String id) async {
    emit(UserDataLoadingStates());
    currentUser = FirebaseAuth.instance.currentUser; // Get current user
    if (currentUser == null || currentUser?.uid.isEmpty == true) {
      emit(UserDataErrorStates("User is not authenticated."));
      return;
    }
    try {
      updateUserModel = await updateRepo.getUser(currentUser!.uid); // Pass valid user ID
      emit(UserDataSuccessStates());
    } catch (e) {
      emit(UserDataErrorStates(e.toString()));
    }
  }


  /// Dr osama
  Future<void> deleteUser() async {
    try {
      await updateRepo.deleteUser();
    } catch (e) {
      rethrow;
    }
  }

  /// Dr osama
  Future<void> logOutUser() async {
    try {
      await updateRepo.logOutUser();
    } catch (e) {
      rethrow;
    }
  }
}
