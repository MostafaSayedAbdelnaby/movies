// import 'package:flutter/material.dart';
// import 'package:movies_app/core/widgets/app_colors.dart';
// import 'package:movies_app/core/widgets/movies_elevated_button.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   static const routeName = '/movie-details-screen';
//   const MovieDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     int movieId = ModalRoute.of(context)!.settings.arguments as int;
//     return FutureBuilder(
//         future: ApiHelper().getMovieDetails(movieId),
//         //initialData: InitialData,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }
//
//           return Scaffold(
//             backgroundColor: Colors.transparent,
//             appBar: AppBar(
//               backgroundColor: Colors.transparent,
//             ),
//             body: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage(
//                           "https://image.tmdb.org/t/p/w500/${snapshot.data!.posterPath}"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: null /* add child content here */,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [const Spacer(),
//                       Text(
//                         snapshot.data!.title,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         '${snapshot.data!.releaseDate}',
//                         style: const TextStyle(
//                             color: Colors.white, fontSize: 24),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 16),
//                       MoviesElevatedButton(
//                           backgroundColor: AppColors.redColor,
//                           child: const Text('Watch',
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 20)),
//                           onPressed: () {}),
//                       const SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           RowItem(
//                               imageName: 'vote_count',
//                               data: snapshot.data!.voteCount),
//                           const SizedBox(width: 16),
//                           RowItem(
//                               imageName: 'run_time',
//                               data: snapshot.data!.runtime),
//                           const SizedBox(width: 16),
//                           RowItem(
//                               imageName: 'vote_average',
//                               data: snapshot.data!.voteAverage),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Screen Shots',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                         ),
//
//                       ),
//                       const SizedBox(height: 16),
//
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
//
// class RowItem extends StatelessWidget {
//   String imageName;
//   num data;
//   RowItem({
//     required this.imageName,
//     required this.data,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 47,
//       width: 100,
//       decoration: BoxDecoration(
//           color: AppColors.backgroundColor,
//           borderRadius: BorderRadius.circular(16)),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//         Image.asset('assets/images/$imageName.png'),
//         Text(
//           '$data',
//           style: const TextStyle(color: Colors.white, fontSize: 20),
//         )
//       ]),
//     );
//   }
// }
