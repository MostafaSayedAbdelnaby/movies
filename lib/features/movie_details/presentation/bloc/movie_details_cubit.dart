import 'package:bloc/bloc.dart';
import 'package:movies_app/features/movie_details/data/model/movie_details_model.dart';

import '../../domain/repositories/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsRepo movieDetailsRepo;

  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsLoadingState());

    try {
      var movieDetailsModel = await movieDetailsRepo.getMovieDetails(movieId);
      emit(MovieDetailsSuccessState(movieDetailsModel));
    } catch (e) {
      emit(MovieDetailsErrorState(e.toString()));
    }
  }
}
