import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/features/home/data/models/genre_model.dart';
import 'package:movies_app/features/home/domain/repositories/movie_repo.dart';

import '../models/movie_model.dart';

class MovieRepoImp implements MovieRepo {
  MovieRemoteDataSource movieRemoteDataSource;

  MovieRepoImp(this.movieRemoteDataSource);

  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    try {
      var movieModelList = await movieRemoteDataSource.getNowPlayingMovie();
      // print(movieModelList[0].title);
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> getMovieByGenre(String genre) async {
    try {
      var movieModelList = await movieRemoteDataSource.getMovieByGenre(genre);
      // print(movieModelList[0].title);
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      var movieModelList = await movieRemoteDataSource.getTopRatedMovies();
      // print(movieModelList[0].title);
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      var movieModelList = await movieRemoteDataSource.getUpcomingMovies();
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      var movieModelList = await movieRemoteDataSource.searchMovies(query);
      // print(movieModelList[0].title);
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<GenreModel>> getGenre() async{
    try {
      var genreModelList = await movieRemoteDataSource.getGenre();
      // print(movieModelList[0].title);
      return genreModelList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
