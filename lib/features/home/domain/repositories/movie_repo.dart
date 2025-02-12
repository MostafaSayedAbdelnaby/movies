import 'package:movies_app/features/home/data/models/movie_model.dart';

abstract class MovieRepo{
 Future<List<MovieModel>> getNowPlayingMovie();
}