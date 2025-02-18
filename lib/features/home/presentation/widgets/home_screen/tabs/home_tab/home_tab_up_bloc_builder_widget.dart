import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';
import 'package:movies_app/features/home/presentation/widgets/home_screen/tabs/home_tab/home_tab_up_loaded_widget.dart';

import '../../../../../../../core/widgets/service_locator.dart';

class HomeTabUpBlocBuilderWidget extends StatefulWidget {
  const HomeTabUpBlocBuilderWidget({super.key});

  @override
  State<HomeTabUpBlocBuilderWidget> createState() =>
      _HomeTabUpBlocBuilderWidgetState();
}

class _HomeTabUpBlocBuilderWidgetState
    extends State<HomeTabUpBlocBuilderWidget> {
  @override
  void initState() {
    // BlocProvider.of<MovieCubit>(context).getNowPlayingMovie();
    super.initState();
  }

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
        } else if (state is NowPlayingMovieSuccessState) {
          serviceLocator<MovieCubit>()
              .setBackgroundImage(state.movieModelList[0].posterPath ?? "");
          return HomeTabUpLoadedWidget(movieModelList: state.movieModelList);
        }
        return const SizedBox();
      },
    );
  }
}
