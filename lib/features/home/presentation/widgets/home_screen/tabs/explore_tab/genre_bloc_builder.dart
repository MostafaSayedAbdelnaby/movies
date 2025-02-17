import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';

import 'genre_widget.dart';

class GenreBlocBuilder extends StatelessWidget {
  const GenreBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: serviceLocator<MovieCubit>()..getGenre(),
      buildWhen: (previous, current) {
        return (current is GenreLoadingState || current is GenreErrorState || current is GenreSuccessState);
      },
        builder: (context, state) {
          if (state is GenreLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is GenreErrorState){
            return const Center(child: Text("Error"),);
          }
          else if (state is GenreSuccessState){
            return GenreWidget(genreModelList: state.genreModelList);
          }
          return const SizedBox();
        },);
  }
}
