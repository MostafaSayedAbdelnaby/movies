import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../../../movie_card.dart';

class SearchTabLoadedWidget extends StatelessWidget {
  const SearchTabLoadedWidget({super.key, required this.movieModelList});

  final List<MovieModel> movieModelList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movieModelList.length,
      itemBuilder: (context, index) {
        return MovieCard(
            height: 279,
            width: 191,
          movieModel: movieModelList[index],
            );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 20,
        childAspectRatio: 0.67, // Proportion between width and height
      ),
    );

  }
}
