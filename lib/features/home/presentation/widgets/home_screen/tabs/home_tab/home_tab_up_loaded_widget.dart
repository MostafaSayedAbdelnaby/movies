import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../../../movie_card.dart';

class HomeTabUpLoadedWidget extends StatelessWidget {
  final List<MovieModel> movieModelList;

  const HomeTabUpLoadedWidget({super.key, required this.movieModelList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 1,
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
        ),
        itemCount: movieModelList.length ,
        itemBuilder: (context, index, realIndex) {
          return MovieCard(
            height: 300,
            width: 200,
            movieModel: movieModelList[index],
          );
        });
  }
}
