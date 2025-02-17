import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import '../features/home/presentation/widgets/movie_card.dart';

class ExploreListWidget extends StatelessWidget {
  final List<MovieModel> movieModelList;
  const ExploreListWidget({super.key,required this.movieModelList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: movieModelList.length,
      itemBuilder: (context, index) {
        return  MovieCard(
          height: 279,
          width: 189,
          movieModel: movieModelList[index],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 16,
          childAspectRatio: 0.67, //proportion between width and height.
      ),
    );
  }
}