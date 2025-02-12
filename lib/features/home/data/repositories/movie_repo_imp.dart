import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/features/home/domain/repositories/movie_repo.dart';

class MovieRepoImp implements MovieRepo{
 MovieRemoteDataSource movieRemoteDataSource;
 HomeRepoImp(this.movieRemoteDataSource);
Future<List<MovieModel>>> getNowPlayingMovie()async{
   try{
    var movieModelList =await homeRemoteDataSOurces.getNowPlayingMovie();
	
	var movieEntityList = movieModelList.map((item){
	    return item as MovieEntity
	}).toList();
	}onServerException{
	  return left(ServerFailure());
	}
	
   
}
}