import 'package:get_it/get_it.dart' as di;
import 'package:movies_app/features/movie_details/data/data_source/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/data_source/movie_details_remote_data_source_imp.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_details_repo_imp.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import '../../features/home/data/data_sources/movie_remote_data_source.dart';
import '../../features/home/data/data_sources/movie_remote_data_source_imp.dart';
import '../../features/home/data/repositories/movie_repo_imp.dart';
import '../../features/home/domain/repositories/movie_repo.dart';
import '../../features/home/presentation/bloc/movie_cubit/movie_cubit.dart';

final serviceLocator = di.GetIt.instance;

// global

Future<void> setUpServiceLocator()async {
  //movie model
  // registerSingleton means object create only once & dependency inversion
  serviceLocator.registerSingleton<MovieRemoteDataSource>(MovieRemoteDataSourceImp());
  serviceLocator.registerSingleton<MovieRepo>(MovieRepoImp(serviceLocator.get<MovieRemoteDataSource>()));
      // serviceLocator.registerSingleton<NowPlayingUseCase>(NowPlayingUseCase().get<MovieRepo>());
  // serviceLocator.registerSingleton(MovieCubit(serviceLocator.get<MovieRepo>()));
  serviceLocator.registerSingleton(MovieCubit(serviceLocator.get<MovieRepo>()));

  // MovieDetailsSingletons

  serviceLocator.registerSingleton<MovieDetailsRemoteDataSource>(MovieDetailsRemoteDataSourceImp());
  serviceLocator.registerSingleton<MovieDetailsRepo>(MovieDetailsRepoImp(serviceLocator.get<MovieDetailsRemoteDataSource>()));
  serviceLocator.registerSingleton(MovieDetailsCubit(serviceLocator.get<MovieDetailsRepo>()));

}
