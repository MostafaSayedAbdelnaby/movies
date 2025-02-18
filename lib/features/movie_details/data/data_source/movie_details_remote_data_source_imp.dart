import 'dart:convert';

import 'package:movies_app/features/movie_details/data/model/movie_details_model.dart';
import "package:http/http.dart" as http;
import '../../../../core/app_constant.dart';
import 'movie_details_remote_data_source.dart';

class MovieDetailsRemoteDataSourceImp extends MovieDetailsRemoteDataSource {
  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/$movieId", {});

    var response =
        await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
    try {
      var data = response.body;
      var json = jsonDecode(data);
      var movieDetailsModel = MovieDetailsModel.fromJson(json);
      return movieDetailsModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<String>> getMovieDetailsScreenShots(int movieId) async {
    var uri = Uri.https(AppConstant.BASE_URL, "/3/movie/$movieId/images", {});
    var response =
        await http.get(uri, headers: {"Authorization": AppConstant.API_KEY});
    try {
      var data = response.body;
      var json = jsonDecode(data);
      var movieDetailsScreenShotsPath = (json["backdrops"] as List).map((item) {
        return item["file_path"] as String;
      }).toList();
      // print(movieDetailsScreenShotsPath);
      return movieDetailsScreenShotsPath;
    } catch (e) {
      throw Exception(e);
    }
  }

}
