abstract class UpdateStates{}

class UpdateInitial extends UpdateStates{}

class UpdateOnLoadingStates extends UpdateStates{}
class UpdateOnErrorStates extends UpdateStates{
  String message;
  UpdateOnErrorStates(this.message);
}
class UpdateOnSuccessStates extends UpdateStates{}
