abstract class MovieState{}
class MovieInitState extends HomeState{}
class MovieLoadingtState extends MovieState{}
class MovieSuccessState extends MovieState{
  final MovieEntityList;
  MovieSuccessState(this.MovieEntityList);
  
}
class MovieErrorState extends HomeState{
  final String message;
  MovieErrorState(this.message);
  
}