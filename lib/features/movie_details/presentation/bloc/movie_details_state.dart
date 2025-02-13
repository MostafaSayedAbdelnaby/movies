part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsErrorState extends MovieDetailsState {
  String message;

  MovieDetailsErrorState(this.message);
}

class MovieDetailsSuccessState extends MovieDetailsState {
  MovieDetailsModel movieDetailsModel;

  MovieDetailsSuccessState(this.movieDetailsModel);
}
