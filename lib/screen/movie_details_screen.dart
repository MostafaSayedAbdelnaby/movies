import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/movie-details-screen';
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int movieId = ModalRoute.of(context)!.settings.arguments as int;
    return FutureBuilder(
        future: ApiHelper().getMovieDetails(movieId),
        //initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Scaffold(
            backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
            body: Stack(alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${snapshot.data!.posterPath}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: null /* add child content here */,
                ),
                Text(
                  snapshot.data!.title,style: const TextStyle(color: Colors.white,fontSize: 24),)
              ],
            ),
          );
        });
  }
}
