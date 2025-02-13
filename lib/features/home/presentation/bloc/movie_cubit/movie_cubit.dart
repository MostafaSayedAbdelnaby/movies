import 'package:movies_app/features/home/presentation/bloc/movie_state/movie_state.dart';

class MovieCubit extends Cubit<MovieState>{
final NowPlayingUseCase nowPlayingUseCase
HomeCubit(this.nowPlayingUseCase):super(MovieInitState());
 getNowPlayingMovie()async{
  emit(MovieLoadingtState());
  final movieeList = await nowPlayingUseCase();
  movieModelList.fold(
    (failure){
	  emit(MovieErrorState('error');
	},
	(movieModelList){
	  emit(MovieSuccessState(movieModelList);
	}
  );
  
   
 }
}