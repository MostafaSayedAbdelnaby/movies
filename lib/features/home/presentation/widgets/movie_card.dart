import 'package:flutter/material.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../../../../core/widgets/app_colors.dart';
import '../../../movie_details/data/model/movie_details_model.dart';

class MovieCard extends StatelessWidget {
  final double height;
  final double width;
  final MovieModel? movieModel;
  final MovieDetailsModel? movieDetailsModel;


  const MovieCard({
    this.movieModel,
    super.key,
    this.height = 220,
    this.width = 140,
    this.movieDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), ),
      child: GestureDetector(
        onTap: () {
          /// **************************************
          Navigator.pushNamed(context, AppRoutes.movieDetailsRoute,
              arguments: movieModel!.id);
        },
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: movieModel?.posterPath != null ? Image.network(
                    'https://image.tmdb.org/t/p/w500/${movieModel!.posterPath}',
                fit: BoxFit.fill,
              ) :  Center(child:Text("No Image", style:textTheme.labelLarge,),)
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
                    movieModel?.voteAverage != null
                        ? movieModel!.voteAverage.toString().length > 2
                        ? movieModel!.voteAverage.toString().substring(0, 3)
                        : movieModel!.voteAverage.toString()
                        : '5.5',
                    style: const TextStyle(color: AppColors.textColor),
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
