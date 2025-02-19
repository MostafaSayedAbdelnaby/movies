abstract class ProfileStates {}

class UserDataInitial extends ProfileStates {}

class UserDataLoadingState extends ProfileStates {}

class UserDataSuccessState extends ProfileStates {}

class UserDataErrorState extends ProfileStates {
  String message;

  UserDataErrorState(this.message);
}
class UpdateDataUserLoadingState extends ProfileStates {}

class UpdateDataUserSuccessState extends ProfileStates {}

class UpdateDataUserErrorState extends ProfileStates {
  String message;

  UpdateDataUserErrorState(this.message);
}