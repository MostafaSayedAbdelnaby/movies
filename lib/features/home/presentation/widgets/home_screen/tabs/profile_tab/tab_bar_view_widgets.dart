import 'package:flutter/material.dart';

import '../../../../../../movie_details/data/model/movie_details_model.dart';
import '../../../movie_card.dart';

class TabBarViewWidgets extends StatelessWidget {
  final List<MovieDetailsModel>? movieDetailsModel;

  const TabBarViewWidgets({super.key, this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    if (movieDetailsModel == null ) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/popcorn.png'),
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return MovieCard(
                    movieDetailsModel: movieDetailsModel?[index],
                  );
                },
                childCount: movieDetailsModel?.length ?? 0,
              ),
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                  crossAxisCount: 3,
              ),
            ),
          ],
        ),
      );
    }
  }
}