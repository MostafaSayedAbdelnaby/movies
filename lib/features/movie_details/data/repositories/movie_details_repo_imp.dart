import 'package:movies_app/features/movie_details/data/model/movie_details_model.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repo.dart';

import '../data_source/movie_details_remote_data_source.dart';

class MovieDetailsRepoImp extends MovieDetailsRepo {
  MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;

  MovieDetailsRepoImp(this.movieDetailsRemoteDataSource);

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    try {
      return await movieDetailsRemoteDataSource.getMovieDetails(movieId);
    } catch (e) {
      throw Exception(e);
    }
  }
}
