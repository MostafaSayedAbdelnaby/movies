import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_bloc_builder.dart';


class MovieDetailsScreen extends StatelessWidget {
  // static const tag = '/movie-details-screen';
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var movieId = ModalRoute.of(context)?.settings.arguments as int ;
   return BlocProvider(
     create: (context) {
       return serviceLocator<MovieDetailsCubit>()..getMovieDetails(movieId);
     },
     child: MovieDetailsBloBuilder()
   );
  }
}

