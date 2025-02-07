import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  //MovieEntity movieEntity;
  //String? poster_path;
  MovieModel? movieModel;
   MovieCard({ this.movieModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(movieModel?.title);
    return Container(
      height: 351,
      width: 234,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movieModel?.posterPath}',
              )),
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
                  style: TextStyle(
                   
                    color: Colors.white
                  ),
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
    );
  }
}
