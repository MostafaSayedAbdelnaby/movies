import 'dart:convert';

import 'package:movies_app/core/app_constant.dart';
import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/features/home/data/models/genre_model.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    try {
      var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/now_playing", {});

      var response =
          await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item) {
        return MovieModel.fromJson(item);
      }).toList();

      // print(json);
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  //get upcoming movies
  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/upcoming", {});
      var response =
          await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item) {
        return MovieModel.fromJson(item);
      }).toList();
      // print(movieModelList[0].title);

      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  //get top rated movie
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/top_rated", {});
      var response =
          await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item) {
        return MovieModel.fromJson(item);
      }).toList();
      // print(json);

      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  //method for searching movies
  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    var uri =
        Uri.https(AppConstant.BASE_URL, "/3/search/movie", {"query": query});
    var response =
        await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
    try {
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item) {
        return MovieModel.fromJson(item);
      }).toList();
      // print(json["results"]);
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  //get movie by genre
  @override
  Future<List<MovieModel>> getMovieByGenre(String genre) async {
    var uri = Uri.https(AppConstant.BASE_URL, "3/discover/movie", {
      "with_genres": genre,
    });

    var response =
        await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
    try {
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item) {
        return MovieModel.fromJson(item);
      }).toList();
      // print(json["results"]);
      return movieModelList;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<GenreModel>> getGenre() async {
    var uri = Uri.https(AppConstant.BASE_URL, "3/genre/movie/list", {});

    var response =
        await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
    try {
      var data = response.body;
      var json = jsonDecode(data);
      var genreModelList = (json["genres"] as List).map((item) {
        return GenreModel.fromJson(item);
      }).toList();
      // print(json["genres"]);
      return genreModelList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
