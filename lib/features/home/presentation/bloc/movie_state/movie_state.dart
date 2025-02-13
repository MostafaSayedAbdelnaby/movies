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


class TopRateMoviesLoadingState extends MovieState {}
class TopRateMoviesSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  TopRateMoviesSuccessState(this.movieModelList);
}
class TopRateMoviesErrorState extends MovieState {
  final String message;
  TopRateMoviesErrorState(this.message);
}

class SearchMoviesLoadingState extends MovieState {}
class SearchMoviesSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  SearchMoviesSuccessState(this.movieModelList);
}
class SearchMoviesErrorState extends MovieState {
  final String message;
  SearchMoviesErrorState(this.message);
}

class ByGenreMoviesLoadingState extends MovieState {}
class ByGenreMoviesSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  ByGenreMoviesSuccessState(this.movieModelList);
}
class ByGenreMoviesErrorState extends MovieState {
  final String message;
  ByGenreMoviesErrorState(this.message);
}
