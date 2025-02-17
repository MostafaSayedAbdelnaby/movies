import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';

import '../../../movie_card.dart';

class HomeTabUpLoadedWidget extends StatelessWidget {
  final List<MovieModel> movieModelList;

   const HomeTabUpLoadedWidget({super.key, required this.movieModelList});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 0,
          aspectRatio: 16 / 9,
          animateToClosest: true,
          disableCenter: false,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          viewportFraction: 0.6,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 0.46,
          height: 300,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            serviceLocator<MovieCubit>().setBackgroundImage(index);
          },
        ),
        itemCount: movieModelList.length,
        itemBuilder: (context, index, realIndex) {
          return MovieCard(
            height: 300,
            width: 200,
            movieModel: movieModelList[index],
          );
        });
  }
}
