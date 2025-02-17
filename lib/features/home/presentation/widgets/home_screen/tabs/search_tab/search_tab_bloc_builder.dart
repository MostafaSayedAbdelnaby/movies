import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';
import 'package:movies_app/features/home/presentation/widgets/home_screen/tabs/search_tab/search_tab_Loaded_widget.dart';

// ignore: must_be_immutable
class SearchTabBlocBuilder extends StatelessWidget {
  SearchTabBlocBuilder({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: serviceLocator<MovieCubit>(),
      builder: (context, state) {

        if (state is SearchMoviesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SearchMoviesErrorState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchMoviesSuccessState) {
          return SearchTabLoadedWidget(movieModelList: state.movieModelList);
        }
        return Center(
          child: Image.asset("assets/images/popcorn.png"),
        );
      },
    );
  }
}
