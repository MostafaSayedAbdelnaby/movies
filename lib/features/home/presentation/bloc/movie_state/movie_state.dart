import 'package:movies_app/features/home/data/models/genre_model.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class MovieState{}
class MovieInitState extends MovieState{}

class NowPlayingMovieLoadingState extends MovieState{}
class NowPlayingMovieSuccessState extends MovieState{
  final List<MovieModel> movieModelList;
  NowPlayingMovieSuccessState(this.movieModelList);
}
class NowPlayingMovieErrorState extends MovieState{
  final String error;
  NowPlayingMovieErrorState(this.error);

}

class UpcomingMoviesLoadingState extends MovieState {}
class UpcomingMoviesSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  UpcomingMoviesSuccessState(this.movieModelList);
}
class UpcomingMoviesErrorState extends MovieState {
  final String error;
  UpcomingMoviesErrorState(this.error);
}


class TopRateMoviesLoadingState extends MovieState {}
class TopRateMoviesSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  TopRateMoviesSuccessState(this.movieModelList);
}
class TopRateMoviesErrorState extends MovieState {
  final String error;
  TopRateMoviesErrorState(this.error);
}

class SearchMoviesLoadingState extends MovieState {}
class SearchMoviesSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  SearchMoviesSuccessState({required this.movieModelList});
}
class SearchMoviesErrorState extends MovieState {
  final String error;
  SearchMoviesErrorState(this.error);
}

// class ByGenreMoviesLoadingState extends MovieState {}
// class ByGenreMoviesSuccessState extends MovieState {
//   final List<MovieModel> movieModelList;
//   ByGenreMoviesSuccessState(this.movieModelList);
// }
// class ByGenreMoviesErrorState extends MovieState {
//   final String error;
//   ByGenreMoviesErrorState(this.error);
// }


class GenreLoadingState extends MovieState {}
class GenreSuccessState extends MovieState {
  final List<GenreModel> genreModelList;
  GenreSuccessState(this.genreModelList);
}
class GenreErrorState extends MovieState {
  final String error;
  GenreErrorState(this.error);
}


class ExploreLoadingState extends MovieState {}
class ExploreSuccessState extends MovieState {
  final List<MovieModel> movieModelList;
  ExploreSuccessState(this.movieModelList);
}
class ExploreErrorState extends MovieState {
  final String error;
  ExploreErrorState(this.error);
}