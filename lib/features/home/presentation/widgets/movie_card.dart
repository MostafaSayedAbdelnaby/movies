import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../../../movie_details/presentation/screen/movie_details_screen.dart';

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
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MovieDetailsScreen.tag,
              arguments: movieModel!.id);
        },
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movieModel?.posterPath}',
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
                    movieModel?.voteAverage.toString().substring(0, 3) ?? '5.5',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    'assets/images/icon_rate.png',
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
