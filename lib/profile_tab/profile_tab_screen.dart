//
// import 'package:flutter/material.dart';
// import 'package:movies_app/features/home/data/models/movie_model.dart';
// import 'package:movies_app/screen/home_screen/tabs/profile_tab/profile_tab_bar.dart';
// import '../../../../api_helper/api_helper.dart';
// import '../../move_card.dart';
//
// class ProfileTab extends StatelessWidget {
//   const ProfileTab({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: const Color(0xFF121312),
//         body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [
//               const SliverAppBar(
//                 expandedHeight: 389,
//                 collapsedHeight: 389,
//                 pinned: false,
//                 flexibleSpace: SafeArea(child: ProfileTabBar()),
//               )
//             ];
//           },
//           body: TabBarView(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     child: Image.asset('assets/images/popcorn.png'),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
//                 child: FutureBuilder<List<MovieModel>>(
//                     future: ApiHelper().getWatchNowMovies(),
//                     builder: (context, snapshot) {
//                       return CustomScrollView(
//                         physics: const NeverScrollableScrollPhysics(),
//                         slivers: [
//                           SliverGrid(
//                             delegate: SliverChildBuilderDelegate(
//                                   (context, index) {
//                                 return MovieCard(
//                                   movieModel: snapshot.data?[index],
//                                 );
//                               },
//                               childCount: snapshot.data?.length,
//                             ),
//                             gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                               mainAxisSpacing: 16,
//                               crossAxisSpacing: 16,
//                               childAspectRatio: 0.55,
//                               crossAxisCount: 3,
//                             ),
//                           ),
//                         ],
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
