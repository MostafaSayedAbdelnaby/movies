
abstract class UserDataStates{}

class UserDataInitial extends UserDataStates{}

// UserDataStates
class UserDataLoadingStates extends UserDataStates {}

class UserDataSuccessStates extends UserDataStates {
}

class UserDataErrorStates extends UserDataStates {
  String message;

  UserDataErrorStates(this.message);
}

// UpdateStates
class UpdateOnLoadingStates extends UserDataStates{}
class UpdateOnErrorStates extends UserDataStates{
  String message;
  UpdateOnErrorStates(this.message);
}
class UpdateOnSuccessStates extends UserDataStates{}
