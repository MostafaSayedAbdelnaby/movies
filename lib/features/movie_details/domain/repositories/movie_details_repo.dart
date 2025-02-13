import 'package:movies_app/features/movie_details/data/model/movie_details_model.dart';

abstract class MovieDetailsRepo {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}
