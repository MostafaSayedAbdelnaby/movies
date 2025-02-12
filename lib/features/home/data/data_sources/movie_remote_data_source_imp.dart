import 'dart:convert';

import 'package:movies_app/core/app_constant.dart';
import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImp implements MovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovie()async{
      var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/now_playing", {});
  
      var response = await http.get(uri, headers: {
        "Authorization":
            AppConstant.API_KEY
      });
	  try{
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item) {
        return MovieModel.fromJson(item);
      }).toList();
      
      return movieModelList;
    }
    catch(e){
      throw Exception(e);
    }
    
  }
  
  //get upcoming movies
  Future<List<MovieModel>> getUpcomingMovies() async {
    var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/upcoming", {});
    var response = await http.get(uri, headers: {
      "Authorization": AppConstant.API_KEY
          
    });
	try{
    var data = response.body;
    var json = jsonDecode(data);
    var movieModelList = json["results"].map((item) {
      return MovieModel.fromJson(item);
    }).toList();
    print(movieModelList[0].title);

    return movieModelList;
  }
  catch(e){
    throw Exception(e);
  }
  }
  
  //get top rated movied
  Future<List<MovieModel>> getTopRatedMovies() async {
    var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/top_rated", {});
    var response = await http.get(uri, headers: {
      "Authorization": AppConstant.API_KEY
          
    });
	try{
    var data = response.body;
    var json = jsonDecode(data);
    var movieModelList = (json["results"] as List).map((item) {
      return MovieModel.fromJson(item);
    }).toList();
    print(json);

    return movieModelList;
  }
  catch(e){
    throw Exception(e);
  }
  }
  
  //method for searching movies
  Future<List<MovieModel>> searchMovies(String query) async {
    var uri = Uri.https(AppConstant.BASE_URL, "/3/search/movie", {"query": query});
    var response = await http.get(uri, headers: {
      "Authorization":AppConstant.API_KEY
          });
	try{
    var data = response.body;
    var json = jsonDecode(data);
    var movieModelList = (json["results"] as List).map((item) {
      return MovieModel.fromJson(item);
    }).toList();
    print(json["results"]);
    return movieModelList;
  }
  catch(e){
    throw Exception(e);
  }
  }
  
  //get movie by genre
  Future<List<MovieModel>> getMovieByGenre (String genre) async{
    const String baseUrl = "api.themoviedb.org";
    var uri = Uri.https(AppConstant.BASE_URL, "3/discover/movie", {
      "with_genres" : genre,
    });
    
      var response = await http.get(uri, headers: {
        "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
      });
	  try{
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item){
        return MovieModel.fromJson(item);
      }).toList();
      print(json["results"]);
      return movieModelList;
    }
    catch(e){
      throw Exception(e);
    }
    
  }

}