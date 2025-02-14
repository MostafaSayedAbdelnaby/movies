import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/row_item.dart';
import '../../../../core/widgets/app_colors.dart';
import '../../../../core/widgets/movies_elevated_button.dart';
import '../../data/model/movie_details_model.dart';

class MovieDetailWidget extends StatelessWidget {
  final MovieDetailsModel? movieDetailsModel;

  const MovieDetailWidget({super.key, this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500/${movieDetailsModel?.posterPath}"),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Text(
                  movieDetailsModel?.title ?? "Ahmed Ali",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  '${movieDetailsModel?.releaseDate}',
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                MoviesElevatedButton(
                    backgroundColor: AppColors.redColor,
                    child: const Text('Watch',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {}),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RowItem(
                        imageName: 'vote_count',
                        data: "${movieDetailsModel!.voteCount}"),
                    const SizedBox(width: 16),
                    RowItem(
                        imageName: 'run_time',
                        data: "${movieDetailsModel?.runtime}"),
                    const SizedBox(width: 16),
                    RowItem(
                        imageName: 'vote_average',
                        data:
                            "${movieDetailsModel?.voteAverage.toString().substring(0, 3)}"),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Screen Shots',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
