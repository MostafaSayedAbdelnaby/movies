import "dart:convert";
import "package:http/http.dart" as http;
import "package:movies_app/features/home/data/models/movie_details_model.dart";
import "package:movies_app/features/home/data/models/movie_model.dart";

import "../features/home/data/models/genre_model.dart";

class ApiHelper {
  static const String baseUrl = "api.themoviedb.org";
  Future<List<MovieModel>> getWatchNowMovies() async {
    var uri = Uri.https(baseUrl, "/3/movie/now_playing", {});
    try {
      var response = await http.get(uri, headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
      });
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item) {
        return MovieModel.fromJson(item);
      }).toList();
      print(movieModelList[1].title);
      // print(json);
      return movieModelList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    var uri = Uri.https(baseUrl, "/3/movie/upcoming", {});
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
    });
    var data = response.body;
    var json = jsonDecode(data);
    var movieModelList = json["results"].map((item) {
      return MovieModel.fromJson(item);
    }).toList();
    print(movieModelList[0].title);

    return movieModelList;
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    var uri = Uri.https(baseUrl, "/3/movie/top_rated", {});
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
    });
    var data = response.body;
    var json = jsonDecode(data);
    var movieModelList = (json["results"] as List).map((item) {
      return MovieModel.fromJson(item);
    }).toList();
    print(json);

    return movieModelList;
  }


//method for retrieving movie details
  Future<MovieDetailsModel?> getMovieDetails(int movieId) async {
    var uri = Uri.https(baseUrl, "/3/movie/$movieId", {});
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
    });
    try {
      var data = response.body;
      var json = jsonDecode(data);
      var movieDetailsModel = MovieDetailsModel.fromJson(json);
      print(json);
      return movieDetailsModel;
    } catch (e) {
      print(e);
      return null;
    }
  }


  //method for searching movies
  Future<List<MovieModel>> searchMovies(String query) async {
    var uri = Uri.https(baseUrl, "/3/search/movie", {"query": query});
    var response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"});
    var data = response.body;
    var json = jsonDecode(data);
    var movieModelList = (json["results"] as List).map((item) {
      return MovieModel.fromJson(item);
    }).toList();
    print(json["results"]);
    return movieModelList;
  }

  // method to get Genres
  Future<List<GenreModel>> getGenres() async{
    const String baseUrl = "api.themoviedb.org";
    var uri = Uri.https(baseUrl, "3/genre/movie/list", {});
    try
    {
      var response = await http.get(uri, headers: {
        "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
      });
      var data = response.body;
      var json = jsonDecode(data);
      var genreModelList = (json["genres"] as List).map((item){
        return GenreModel.fromJson(item);
      }).toList();
      print(json["genres"]);
      return genreModelList;
    }
    catch(e)
    {
      print(e);
      return [];
    }
  }

  // method to search of genre
  Future<List<MovieModel>> getMovieByGenre (String genre) async{
    const String baseUrl = "api.themoviedb.org";
    var uri = Uri.https(baseUrl, "3/discover/movie", {
      "with_genres" : genre,
    });
    try
    {
      var response = await http.get(uri, headers: {
        "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4"
      });
      var data = response.body;
      var json = jsonDecode(data);
      var movieModelList = (json["results"] as List).map((item){
        return MovieModel.fromJson(item);
      }).toList();
      print(json["results"]);
      return movieModelList;
    }
    catch(e)
    {
      print(e);
      return [];
    }
  }

}
  //eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNTY5NGY4ZDdiYjkwZDI5MTNiZmNhYWEwODk5Yzc4MSIsIm5iZiI6MTczODc0Nzg5Ny4xODUsInN1YiI6IjY3YTMyZmY5ZGMyNGVlOTNkMTgxMTQ0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GaZ3lxtZ0DbPWg2mr5RrPvFZ9IyaQfwidPBUCe_HsO4
