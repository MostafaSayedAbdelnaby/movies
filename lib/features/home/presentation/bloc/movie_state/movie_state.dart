import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class MovieState{}
class MovieInitState extends MovieState{}
class MovieLoadingState extends MovieState{}
class MovieSuccessState extends MovieState{
  final List<MovieModel> movieModelList;
  MovieSuccessState(this.movieModelList);
}
class MovieErrorState extends MovieState{
  final String message;
  MovieErrorState(this.message);

}

class UpcomingMoviesLoadingState extends MovieState {}
class UpcomingMoviesSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  UpcomingMoviesSuccessState(this.movieModelList);
}
class UpcomingMoviesErrorState extends MovieState {
  final String message;
  UpcomingMoviesErrorState(this.message);
}
