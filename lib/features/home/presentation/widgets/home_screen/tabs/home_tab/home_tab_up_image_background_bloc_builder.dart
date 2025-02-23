import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/widgets/service_locator.dart';
import '../../../../bloc/movie_cubit/movie_cubit.dart';
import '../../../../bloc/movie_state/movie_state.dart';

class HomeTabUpImageBackgroundBlocBuilder extends StatelessWidget {
  const HomeTabUpImageBackgroundBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
        bloc: serviceLocator<MovieCubit>(),
        buildWhen: (previous, current) {
          return (current is BackgroundImageState);
        },
        builder: (context, snapshot) {
          if (snapshot is BackgroundImageState) {
            return SizedBox(
                height: 450,
                width: double.infinity,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${snapshot.imagePath}',
                  fit: BoxFit.fill,
                ));
          }
          return const SizedBox();
        });
  }
}
