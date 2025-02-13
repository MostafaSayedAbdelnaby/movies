// import 'package:flutter/material.dart';
//
// class MovieDetailsFutureBuilder extends StatelessWidget {
//   const MovieDetailsFutureBuilder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
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
//         });
//   }
// }
