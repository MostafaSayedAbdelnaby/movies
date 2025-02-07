import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/repositories/home_repo.dart';

import '../screen/home_screen/move_card.dart';

class ExploreList extends StatelessWidget {
  const ExploreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 0,
        itemBuilder: (context, index) {
          return  MovieCard();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 20,
            childAspectRatio: 0.65, //proportion between width and height.
        ),
      ),
    );
  }
}
