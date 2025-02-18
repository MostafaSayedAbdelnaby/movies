import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen_shots_item.dart';

class MovieDetailsScreenShotsWidget extends StatelessWidget {
  final List<String> imagePathList;
  const MovieDetailsScreenShotsWidget({super.key,required this.imagePathList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return MovieDetailsScreenShotsItem(imagePath: imagePathList[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: imagePathList.length,
      ),
    );
  }
}
