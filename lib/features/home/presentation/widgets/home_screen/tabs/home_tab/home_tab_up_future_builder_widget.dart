// import 'package:flutter/material.dart';
// import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source_imp.dart';
// import 'package:movies_app/features/home/data/repositories/movie_repo_imp.dart';
//
// import '../../../../../data/models/movie_model.dart';
// import 'home_tab_up_loaded_widget.dart';
//
// class HomeTabUpFutureBuilderWidget extends StatelessWidget{
//   const HomeTabUpFutureBuilderWidget({super.key});
//
//
// @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<MovieModel>>(
//                 future: MovieRepoImp(MovieRemoteDataSourceImp()).getNowPlayingMovie(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('E123: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text('No data available'));
//                   }
//                   return HomeTabUpLoadedWidget(movieModelList:snapshot.data!);
//                 });
// }
// }