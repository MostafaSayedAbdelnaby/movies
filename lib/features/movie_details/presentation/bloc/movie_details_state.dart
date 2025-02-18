part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

// MovieDetailsStates
class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsErrorState extends MovieDetailsState {
  String message;

  MovieDetailsErrorState(this.message);
}

class MovieDetailsSuccessState extends MovieDetailsState {
  MovieDetailsModel movieDetailsModel;

  MovieDetailsSuccessState(this.movieDetailsModel);
}

// MovieDetailsScreenShotsStates
class MovieDetailsScreenShotsLoadingState extends MovieDetailsState {}

class MovieDetailsScreenShotsErrorState extends MovieDetailsState {
  String message;

  MovieDetailsScreenShotsErrorState(this.message);
}

class MovieDetailsScreenShotsSuccessState extends MovieDetailsState {
  List<String> movieDetailsScreenShotsPath;

  MovieDetailsScreenShotsSuccessState(this.movieDetailsScreenShotsPath);
}
