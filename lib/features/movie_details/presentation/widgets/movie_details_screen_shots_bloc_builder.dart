import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen_shots_widget.dart';

import '../bloc/movie_details_cubit.dart';

class MovieDetailsScreenShotsBlocBuilder extends StatelessWidget {
  const MovieDetailsScreenShotsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      bloc: serviceLocator<MovieDetailsCubit>(),
      buildWhen: (previous, current) {
        return (current is MovieDetailsScreenShotsLoadingState ||
            current is MovieDetailsScreenShotsErrorState ||
            current is MovieDetailsScreenShotsSuccessState);
      },
      builder: (context, state) {
        if (state is MovieDetailsScreenShotsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieDetailsScreenShotsErrorState) {
          return const Center(
            child: Text("Error"),
          );
        } else if (state is MovieDetailsScreenShotsSuccessState) {
          return MovieDetailsScreenShotsWidget(
              imagePathList: state.movieDetailsScreenShotsPath);
        }
        return const SizedBox();
      },
    );
  }
}
