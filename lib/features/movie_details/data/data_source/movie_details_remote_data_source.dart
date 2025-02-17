import '../model/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails (int movieId);
  Future<List<String>> getMovieDetailsScreenShots (int movieId);
}