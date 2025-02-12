import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';
import 'package:movies_app/features/home/presentation/widgets/home_screen/tabs/home_tab/home_tab_up_loaded_widget.dart';

class HomeTabUpBlocBuilderWidget extends StatefulWidget {
  const HomeTabUpBlocBuilderWidget({super.key});

  @override
  State<HomeTabUpBlocBuilderWidget> createState() => _HomeTabUpBlocBuilderWidgetState();
}

class _HomeTabUpBlocBuilderWidgetState extends State<HomeTabUpBlocBuilderWidget> {

  @override
  void initState() {
    BlocProvider.of<MovieCubit>(context).getNowPlayingMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieErrorState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
          );
        } else if (state is MovieSuccessState) {
          return HomeTabUpLoadedWidget(movieModelList: state.movieModelList);
        }
        return const SizedBox();
      },
    );
  }
}
