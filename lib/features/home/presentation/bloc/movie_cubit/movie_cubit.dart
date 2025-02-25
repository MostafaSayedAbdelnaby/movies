import 'package:bloc/bloc.dart';
import '../../../domain/repositories/movie_repo.dart';
import '../movie_state/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepo movieRepo;
  // int currentIndex = 0;

  MovieCubit(this.movieRepo) : super(MovieInitState());


  setBackgroundImage(String imagePath){
   // currentIndex=index;
   emit(BackgroundImageState(imagePath));
  }

  Future<void> getNowPlayingMovie() async {
    emit(NowPlayingMovieLoadingState());

    try {
      var movieModelList = await movieRepo.getNowPlayingMovie();
      emit(NowPlayingMovieSuccessState(movieModelList));
    } catch (e) {
      emit(NowPlayingMovieErrorState(e.toString()));
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


  Future<void> getTopRatedMovies() async {
    emit(TopRateMoviesLoadingState());

    try{
      var movieModelList = await movieRepo.getTopRatedMovies();
      emit(TopRateMoviesSuccessState(movieModelList));
    }catch (e){
      emit(TopRateMoviesErrorState(e.toString()));
    }
  }

  Future<void> searchMovies(String query) async {
    emit(SearchMoviesLoadingState());

    try{
      var movieModelList = await movieRepo.searchMovies(query);
      emit(SearchMoviesSuccessState(movieModelList: movieModelList));
    }catch (e){
      emit(SearchMoviesErrorState(e.toString()));
    }
  }

  Future<void> getMovieByGenre(String genre) async {
    emit(ExploreLoadingState());

    try{
      var movieModelList = await movieRepo.getMovieByGenre(genre);
      print(movieModelList.length);
      emit(ExploreSuccessState(movieModelList));
    }catch (e){
      emit(ExploreErrorState(e.toString()));
    }
  }

  Future<void> getGenre() async {
    emit(GenreLoadingState());

    try{
      var genreModelList = await movieRepo.getGenre();
      emit(GenreSuccessState(genreModelList));
    }catch (e){
      emit(GenreErrorState(e.toString()));
    }
  }

}