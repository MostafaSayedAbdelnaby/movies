import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../features/home/data/repositories/home_repo.dart';
import '../screen/home_screen/move_card.dart';

class ExploreList extends StatelessWidget {
  const ExploreList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieEntity>>(
      future: HomeRepo().getWatchNowMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error"));
        } else {
          return Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return MovieCard(movieModel: snapshot.data?[index]);
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
      },
    );
  }
}
