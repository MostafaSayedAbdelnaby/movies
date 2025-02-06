import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

class HomeRepo{
 ApiHelper apiHelper = ApiHelper();
  Future<List<MovieEntity>> getWatchNowMovies() async {
   var data = await apiHelper.getWatchNowMovies();
   var movieEntityList = data.map((item) => item as MovieEntity).toList();
   return movieEntityList;
  }

}
