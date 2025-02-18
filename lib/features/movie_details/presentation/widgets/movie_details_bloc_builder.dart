import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details/data/model/movie_details_model.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';

import '../../../../core/widgets/service_locator.dart';
import 'movie_details_widget.dart';

class MovieDetailsBloBuilder extends StatelessWidget {
  final MovieDetailsModel? movieDetailsModel;

  const MovieDetailsBloBuilder({this.movieDetailsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        buildWhen: (previous, current) {
      return (current is MovieDetailsLoadingState ||
          current is MovieDetailsErrorState ||
          current is MovieDetailsSuccessState);
    }, builder: (context, state) {
      if (state is MovieDetailsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is MovieDetailsErrorState) {
        return Center(child: Text(state.message));
      } else if (state is MovieDetailsSuccessState) {
        serviceLocator<MovieDetailsCubit>()
            .getMovieDetailsScreenShots(state.movieDetailsModel.id ?? 0);
        return MovieDetailWidget(movieDetailsModel: state.movieDetailsModel);
      }
      return const SizedBox();
    });
  }
}
