import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/screens/home_screen.dart';

import '../../../../bloc/movie_state/movie_state.dart';
import 'home_tab_up_bloc_builder_widget.dart';
import 'home_tab_up_future_builder_widget.dart';
import 'home_tab_up_loaded_widget.dart';

class HomeTabUp extends StatelessWidget {
  const HomeTabUp({super.key});

  // int backCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      bloc: serviceLocator<MovieCubit>(),
      buildWhen: (previousState, currentState) {
        return (currentState is NowPlayingMovieLoadingState ||
            currentState is NowPlayingMovieSuccessState ||
            currentState is NowPlayingMovieErrorState);
      },
      builder: (context, state) {
        if (state is NowPlayingMovieLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is NowPlayingMovieErrorState) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
          );
        }
        if (state is NowPlayingMovieSuccessState) {
          return Stack(
            children: [
              BlocBuilder<MovieCubit, MovieState>(
                  bloc: serviceLocator<MovieCubit>(),
                  buildWhen: (previous, current) {
                    print(state.runtimeType);
                    return (current is BackgroundImageState);
                  },
                  builder: (context, snapshot) {
                    if (snapshot is BackgroundImageState) {
                      return SizedBox(
                          height: 450,
                          width: double.infinity,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${state.movieModelList[snapshot.currentIndex].posterPath}',
                            fit: BoxFit.fill,
                          ));
                    }
                    return const SizedBox();
                  }),
              Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.backgroundColor.withOpacity(0.8),
                      AppColors.backgroundColor.withOpacity(0.6),
                      AppColors.backgroundColor,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/Available Now.png',
                  ),
                  const SizedBox(height: 20),
                  HomeTabUpLoadedWidget(movieModelList: state.movieModelList),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 300,
                    child: Image.asset(
                      'assets/images/Watch Now.png',
                      // fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
