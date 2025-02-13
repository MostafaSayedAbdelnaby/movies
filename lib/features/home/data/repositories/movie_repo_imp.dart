import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/features/home/domain/repositories/movie_repo.dart';

import '../models/movie_model.dart';

class MovieRepoImp implements MovieRepo{
 MovieRemoteDataSource movieRemoteDataSource;
 MovieRepoImp(this.movieRemoteDataSource);

@override
  Future<List<MovieModel>> getNowPlayingMovie()async{
   try{
    var movieModelList =await movieRemoteDataSource.getNowPlayingMovie();
		return movieModelList ;
	}catch (e){
		 throw Exception(e);
	 }
}

  @override
  Future<List<MovieModel>> getMovieByGenre(String genre) {
    // TODO: implement getMovieByGenre
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async{
    try{
      var movieModelList =await movieRemoteDataSource.getUpcomingMovies();
      return movieModelList ;
    }catch (e){
      throw Exception(e);
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}