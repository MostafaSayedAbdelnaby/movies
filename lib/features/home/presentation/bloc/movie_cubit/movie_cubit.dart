import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../domain/repositories/movie_repo.dart';
import '../movie_state/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
// final NowPlayingUseCase nowPlayingUseCase;
  final MovieRepo movieRepo;

  MovieCubit(this.movieRepo) : super(MovieInitState());

  Future<void> getNowPlayingMovie() async {
    emit(MovieLoadingState());
    try {
      var movieModelList = await movieRepo.getNowPlayingMovie();
      emit(MovieSuccessState(movieModelList));
    } catch (e) {
      emit(MovieErrorState(e.toString()));
    }
  }


  Future<void> getUpcomingMovies() async {
    emit(UpcomingMoviesLoadingState());
    try{
      var movieModelList = await movieRepo.getUpcomingMovies();
      emit(UpcomingMoviesSuccessState(movieModelList));
    }catch (e){
      emit(UpcomingMoviesErrorState(e.toString()));
    }
  }

}