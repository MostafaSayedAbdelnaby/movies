import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';

import '../../../../../../../explore_tab/explore_list_widget.dart';

class ExploreListBlocBuilder extends StatelessWidget {
  const ExploreListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    print("Ali");
    return BlocBuilder(
      bloc: serviceLocator<MovieCubit>()..getMovieByGenre(28.toString()),
      buildWhen: (previous, current) {
        print(current.runtimeType);
        return (current is ExploreLoadingState || current is ExploreErrorState || current is ExploreSuccessState);
      },
      builder: (context, state) {
        if (state is ExploreLoadingState) {
          print("Print");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ExploreErrorState) {
          print("Print Print");
          return const Center(
            child: Text("Error"),
          );
        } else if (state is ExploreSuccessState) {
          print("Print Print Print");
          return ExploreListWidget(
            movieModelList: state.movieModelList,
          );
        }
        return const SizedBox();
      },
    );
  }
}
