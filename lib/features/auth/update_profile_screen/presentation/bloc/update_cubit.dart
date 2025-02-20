import 'package:bloc/bloc.dart';
import 'package:movies_app/features/auth/update_profile_screen/domain/repositories/update_repo.dart';
import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/update_states.dart';

import '../../data/model/update_user_model.dart';

class UpdateCubit extends Cubit<UpdateStates> {
  UpdateRepo updateRepo;

  UpdateCubit({required this.updateRepo}) : super(UpdateInitial());

  Future<void> updateUser(UpdateUserModel updateUserModel) async {
    // emit(UpdateOnLoadingStates());
    try {
      await updateRepo.updateUser(updateUserModel);
      emit(UpdateOnSuccessStates());
    } catch (e) {
      emit(UpdateOnErrorStates(e.toString()));
    }
  }
}
