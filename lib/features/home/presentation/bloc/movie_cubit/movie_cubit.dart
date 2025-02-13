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