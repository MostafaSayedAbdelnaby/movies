import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';
import '../../../../../../../core/widgets/service_locator.dart';
import 'home_tab_down_loaded_widget.dart';

class HomeTabDownBlocBuilderWidget extends StatefulWidget {
  const HomeTabDownBlocBuilderWidget({super.key});

  @override
  State<HomeTabDownBlocBuilderWidget> createState() => _HomeTabDownBlocBuilderWidgetState();
}

class _HomeTabDownBlocBuilderWidgetState extends State<HomeTabDownBlocBuilderWidget> {

  @override
  void initState() {
    // BlocProvider.of<MovieCubit>(context).getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieCubit, MovieState>(
      bloc: serviceLocator<MovieCubit>(),
      buildWhen: (previousState, currentState) {
        return (currentState is UpcomingMoviesLoadingState ||
            currentState is UpcomingMoviesErrorState ||
            currentState is UpcomingMoviesSuccessState);
      },
      builder: (context, state) {
        if (state is UpcomingMoviesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UpcomingMoviesErrorState) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
          );
        } else if (state is UpcomingMoviesSuccessState){
          return HomeTabDownLoadedWidget(movieModelList: state .movieModelList);
        }
        return SizedBox();
      },
    );
  }
}
