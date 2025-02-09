// import 'dart:convert';
// import '../models/movie_details_model.dart';
// import "package:http/http.dart" as http;
//
// class RemoteDataSource{
//   Future<MovieDetailsModel> getMovieDetails(int movieId)async{
//     const String baseUrl = "api.themoviedb.org";
//     var uri = Uri.https(baseUrl, "/3/movie/$movieId", {});
//     var response = await http.get(uri, headers: {
//       "Authorization":
//       "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
//     });
//     var data = response.body;
//     var json = jsonDecode(data);
//     var movieDetailsModel = MovieDetailsModel.fromJson(json);
//     return movieDetailsModel;
//
//   }
// }


import 'dart:convert';
import '../models/movie_details_model.dart';
import "package:http/http.dart" as http;

class RemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    const String baseUrl = "api.themoviedb.org";
    var uri = Uri.https(baseUrl, "/3/movie/$movieId", {});
    var response = await http.get(uri, headers: {
      "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4",

    });

    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);
      var movieDetailsModel = MovieDetailsModel.fromJson(json);
      return movieDetailsModel;
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
