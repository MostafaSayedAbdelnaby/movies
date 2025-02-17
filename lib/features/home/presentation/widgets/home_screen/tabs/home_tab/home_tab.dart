import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';
import '../../../../../data/data_sources/movie_remote_data_source_imp.dart';
import '../../../../../data/repositories/movie_repo_imp.dart';
import 'home_tab_down.dart';
import 'home_tab_up.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, this.onTap});

  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      bloc: serviceLocator<MovieCubit>()..getNowPlayingMovie()..getUpcomingMovies(),
      listener: (context, state) {
        if (state is NowPlayingMovieErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text(state.error),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Ok"))
              ],
            ),
          );
        } else if (state is UpcomingMoviesErrorState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text(state.error),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      // onTap!();
                    },
                    child: const Text("Ok"))
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: Color(0xFF171717),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeTabUp(),
                  SizedBox(height: 22),
                  HomeTabDown(),
                  SizedBox(height: 22),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
