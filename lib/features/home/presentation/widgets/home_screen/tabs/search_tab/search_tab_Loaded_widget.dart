import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../../../movie_card.dart';

class SearchTabLoadedWidget extends StatelessWidget {
  const SearchTabLoadedWidget({super.key, required this.movieModelList});

  final List<MovieModel> movieModelList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: movieModelList.length,
      itemBuilder: (context, index) {
        return MovieCard(
            height: 351,
            width: 234,
          movieModel: movieModelList[index],
            );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 20,
        childAspectRatio: 0.65, // Proportion between width and height
      ),
    );

  }
}
