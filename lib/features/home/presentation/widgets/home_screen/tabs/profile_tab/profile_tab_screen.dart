import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/update_data_source/upate_data_source_impl.dart';
import 'package:movies_app/features/home/presentation/widgets/home_screen/tabs/profile_tab/profile_tab_bar.dart';
import '../../../../../../../core/widgets/service_locator.dart';
import '../../../../../../auth/update_profile_screen/data/repositories/update_repo_impl.dart';
import '../../../../../../auth/update_profile_screen/presentation/bloc/update_cubit.dart';
import '../../../../bloc/movie_cubit/movie_cubit.dart';


class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(updateRepo: UpdateRepoImpl(UpdateDataSourceImpl())),
      child: DefaultTabController(
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
                  flexibleSpace: SafeArea(child: ProfileTabBar(

                  )),
                )
              ];
            },
            body: TabBarView(
              children: [
                // TabBarView 1
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TabBarViewWidgets(
                    //   data: bloc.favoriteResponse,
                    // ),
                    // TabBarViewWidgets(
                    //   data: bloc.historyResponse,
                    // ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/popcorn.png'),
                    ),
                  ],
                ),
                // TabBarView 2
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
      ),
    );
  }
}