import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/row_item.dart';
import '../../../../core/widgets/app_colors.dart';
import '../../../../core/widgets/movies_elevated_button.dart';
import '../../data/model/movie_details_model.dart';
import 'movie_details_screen_shots_bloc_builder.dart';

class MovieDetailWidget extends StatelessWidget {
  final MovieDetailsModel? movieDetailsModel;

  const MovieDetailWidget({super.key, this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
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
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.backgroundColor,
                AppColors.backgroundColor.withOpacity(0.98),
                AppColors.backgroundColor.withOpacity(0.97),
                AppColors.backgroundColor.withOpacity(0.96),
                AppColors.backgroundColor.withOpacity(0.55),
                AppColors.backgroundColor.withOpacity(0.1),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 29),
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/icons/icon_arrow_back.png"),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/icons/icon_save.png"))
                ]),
                // const Spacer(
                //   flex: 1,
                // ),
                Image.asset("assets/images/play_image.png"),
                Text(
                  movieDetailsModel?.title ?? "",
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Text(
                  '${movieDetailsModel?.releaseDate?.substring(0, 4)}',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                MoviesElevatedButton(
                    backgroundColor: AppColors.redColor,
                    child: Text('Watch', style: textTheme.bodyMedium),
                    onPressed: () {}),
                const SizedBox(height: 12),
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
                const SizedBox(height: 12),
                Text('Screen Shots', style: textTheme.bodyLarge),
                const SizedBox(height: 12),
                const SizedBox(
                    height: 400,
                    child: MovieDetailsScreenShotsBlocBuilder()
                ),
                const SizedBox(height: 16),
                Text(
                  'similar',
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
