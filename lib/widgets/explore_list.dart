import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/data_source/remote_data_source.dart';
import 'package:movies_app/features/home/data/models/movie_details_model.dart';
import '../screen/home_screen/move_card.dart';

class ExploreList extends StatelessWidget {
  final int movieId;
  const ExploreList({super.key,required this.movieId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetailsModel>(
      future: RemoteDataSource().getMovieDetails(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          var movieDetails = snapshot.data;
          if (movieDetails == null) {
            return const Center(child: Text('No movie details available.'));
          }
          return GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: 12,  // You might want to make this dynamic if you need more items
            itemBuilder: (context, index) {
              return MovieCard(
                // height: 351,
                // width: 234,
                // movieDetailsModel: movieDetails,  // Pass the entire movieDetailsModel
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 20,
              childAspectRatio: 0.65, // Proportion between width and height
            ),
          );
        } else {
          return const Center(child: Text('No movie details found.'));
        }
      },
    );

    // return Expanded(
    //   child: GridView.builder(
    //     padding: EdgeInsets.zero,
    //     itemCount: 12,
    //     itemBuilder: (context, index) {
    //       return  const MovieCard(height: 351,
    //         width: 234,);
    //     },
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 8,
    //         crossAxisSpacing: 20,
    //         childAspectRatio: 0.65, //proportion between width and height.
    //     ),
    //   ),
    // );
  }
}
