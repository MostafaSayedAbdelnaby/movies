import '../../domain/entities/movie_details_entity.dart';
import '../data_source/remote_data_source.dart';

class MovieDetailsRepo {
  RemoteDataSource remoteDataSource;

  MovieDetailsRepo({required this.remoteDataSource});

  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    var movieDetailsModel = await remoteDataSource.getMovieDetails(movieId);
    return movieDetailsModel as MovieDetailsEntity;
  }
}
