import 'package:movies_app/features/home/data/models/genre_model.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class MovieRemoteDataSource{
 Future<List<MovieModel>> getNowPlayingMovie();
 Future<List<MovieModel>> getUpcomingMovies();
 Future<List<MovieModel>> getTopRatedMovies();
 Future<List<MovieModel>> searchMovies(String query);
 Future<List<MovieModel>> getMovieByGenre (String genre) ;
 Future<List<GenreModel>> getGenre();
}