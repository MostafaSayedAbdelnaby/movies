// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class ScreenShotsWidget extends StatelessWidget {
//   final String? image;
//   const ScreenShotsWidget({super.key, this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(16),
//       child: CachedNetworkImage(
//         imageUrl: 'https://image.tmdb.org/t/p/original/${image?.filePath}',
//         height: 167,
//         width: double.infinity,
//         fit: BoxFit.cover,
//         placeholder: (context, url) =>
//             const Center(child: CircularProgressIndicator()),
//         errorWidget: (context, url, error) =>
//             const Center(child: Icon(Icons.error)),
//       ),
//     );
//   }
// }
