// import 'package:flutter/material.dart';
// import '../features/home/data/models/movie_model.dart';
// import '../features/home/presentation/widgets/movie_card.dart';
//
// class ExploreList extends StatelessWidget {
//   final int genreId;
//   const ExploreList({super.key,required this.genreId});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<MovieModel>>(
//       future: ApiHelper().getMovieByGenre(genreId.toString()),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//           return GridView.builder(
//             padding: EdgeInsets.zero,
//             itemCount: snapshot.data?.length ?? 0,  // You might want to make this dynamic if you need more items
//             itemBuilder: (context, index) {
//               return MovieCard(
//                 // height: 351,
//                 // width: 234,
//                 movieModel: snapshot.data?[index],
//               );
//             },
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 8,
//               crossAxisSpacing: 20,
//               childAspectRatio: 0.65, // Proportion between width and height
//             ),
//           );
//         }
//     );
//
//     // return Expanded(
//     //   child: GridView.builder(
//     //     padding: EdgeInsets.zero,
//     //     itemCount: 12,
//     //     itemBuilder: (context, index) {
//     //       return  const MovieCard(height: 351,
//     //         width: 234,);
//     //     },
//     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //         crossAxisCount: 2,
//     //         mainAxisSpacing: 8,
//     //         crossAxisSpacing: 20,
//     //         childAspectRatio: 0.65, //proportion between width and height.
//     //     ),
//     //   ),
//     // );
//   }
// }
