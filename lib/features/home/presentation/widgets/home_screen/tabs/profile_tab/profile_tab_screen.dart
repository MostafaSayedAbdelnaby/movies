import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/widgets/home_screen/tabs/profile_tab/profile_tab_bar.dart';
import '../../../../../../../core/widgets/service_locator.dart';
import '../../../../bloc/movie_cubit/movie_cubit.dart';


class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: const Color(0xFF121312),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                expandedHeight: 389,
                collapsedHeight: 389,
                pinned: false,
                flexibleSpace: SafeArea(child: ProfileTabBar()),
              )
            ];
          },
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/popcorn.png'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                child:
                BlocProvider(
                    create: (context) {
                      return serviceLocator<MovieCubit>()..getNowPlayingMovie();
                    },
                  child: const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// FutureBuilder<List<MovieModel>>(
// future: ApiHelper().getWatchNowMovies(),
// builder: (context, snapshot) {
// return CustomScrollView(
// physics: const NeverScrollableScrollPhysics(),
// slivers: [
// SliverGrid(
// delegate: SliverChildBuilderDelegate(
// (context, index) {
// return MovieCard(
// movieModel: snapshot.data?[index],
// );
// },
// childCount: snapshot.data?.length,
// ),
// gridDelegate:
// const SliverGridDelegateWithFixedCrossAxisCount(
// mainAxisSpacing: 16,
// crossAxisSpacing: 16,
// childAspectRatio: 0.55,
// crossAxisCount: 3,
// ),
// ),
// ],
// );
// }),