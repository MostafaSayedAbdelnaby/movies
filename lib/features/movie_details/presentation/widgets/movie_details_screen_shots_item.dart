import 'package:flutter/material.dart';

class MovieDetailsScreenShotsItem extends StatelessWidget {
  final String imagePath;
  const MovieDetailsScreenShotsItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          // 'https://image.tmdb.org/t/p/original/${image?.filePath}'
          'https://image.tmdb.org/t/p/w500/$imagePath',
          height: 167,
          width: double.infinity,
          fit: BoxFit.cover,
        ));
  }
}
