import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/screen/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final double height;
  final double width;
  final MovieModel? movieModel;

  const MovieCard({
    this.movieModel,
    super.key,
    this.height = 220,
    this.width = 146,
  });

  @override
  Widget build(BuildContext context) {
    // String posterUrl =
    //     movieModel?.posterPath != null && movieModel?.posterPath != ""
    //         ? 'https://image.tmdb.org/t/p/w500/${movieModel?.posterPath}'
    //         : 'https://via.placeholder.com/150';
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.white
        color: const Color(0xFF121312),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsScreen.routeName,
              arguments: movieModel!.id);
        },
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Image.network(
            //     posterUrl,
            //     fit: BoxFit.cover,
            //     loadingBuilder: (context, child, loadingProgress) {
            //       if (loadingProgress == null) {
            //         return child;
            //       } else {
            //         return const Center(
            //             child: CircularProgressIndicator());
            //       }
            //     },
            //     errorBuilder: (context, error, stackTrace) {
            //       return Image.network('https://via.placeholder.com/150');
            //     },
            //   ),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:
              Image.network(
                /// Dr Ossama
              'https://image.tmdb.org/t/p/w500/${movieModel?.posterPath}',
                // posterUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, right: 8, left: 8),
              alignment: Alignment.center,
              height: 28,
              width: 58,
              decoration: BoxDecoration(
                color: const Color(0xb5121312),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    movieModel?.voteAverage.toString() ?? '5.5',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    'assets/images/rate_icon.png',
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
