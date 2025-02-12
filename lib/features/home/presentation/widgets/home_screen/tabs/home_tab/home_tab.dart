import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'home_tab_down.dart';
import 'home_tab_up.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) {
        // return MovieCubit(MovieRepoImp(MovieRemoteDataSourceImp()))..getNowPlayingMovie();
        return serviceLocator<MovieCubit>();
      } ,
      child: const Scaffold(
        backgroundColor: Color(0xFF171717),
        body: SafeArea(
            child: SingleChildScrollView(
                    child:Column(
            children: [
              HomeTabUp(),
              SizedBox(height: 22),
              HomeTabDown(),
              SizedBox(height: 22),
            ],
                    )
                  )
        ),
      ),
    );
  }
}