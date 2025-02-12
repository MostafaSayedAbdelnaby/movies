import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/movie_card.dart';

class HomeTabDownLoadedWidget extends StatelessWidget{
final movieModelList;
const HomeTabDownLoadedWidget({super.key, required this.movieModelList});
@override
  Widget build(BuildContext context){
  
  return CarouselSlider.builder(
              options: CarouselOptions(
                  initialPage: 1,
                  aspectRatio: 15 / 11,
                  animateToClosest: true,
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  viewportFraction: 0.52,
                  scrollDirection: Axis.horizontal),
              itemCount: movieModelList.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                return  MovieCard(movieModel:movieModelList?[index] ,);
              },
            );
}
}