import 'package:get_it/get_it.dart' as di;
import 'package:movies_app/features/auth/register/domain/repositories/register_repo.dart';
import 'package:movies_app/features/movie_details/data/data_source/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/data_source/movie_details_remote_data_source_imp.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_details_repo_imp.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import '../../features/auth/register/data/data_sources/data_source.dart';
import '../../features/auth/register/data/data_sources/data_source_impl.dart';
import '../../features/auth/register/data/repositories/register_repo_impl.dart';
import '../../features/auth/register/presentation/bloc/register_cubit.dart';
import '../../features/home/data/data_sources/movie_remote_data_source.dart';
import '../../features/home/data/data_sources/movie_remote_data_source_imp.dart';
import '../../features/home/data/repositories/movie_repo_imp.dart';
import '../../features/home/domain/repositories/movie_repo.dart';
import '../../features/home/presentation/bloc/movie_cubit/movie_cubit.dart';

final serviceLocator = di.GetIt.instance;

// Global setup for the service locator

Future<void> setUpServiceLocator() async {
  // registerSingleton means object create only once & dependency inversion
  serviceLocator.registerSingleton<MovieRemoteDataSource>(MovieRemoteDataSourceImp());
  serviceLocator.registerSingleton<MovieRepo>(MovieRepoImp(serviceLocator.get<MovieRemoteDataSource>()));
  serviceLocator.registerSingleton(MovieCubit(serviceLocator.get<MovieRepo>()));

  // MovieDetailsSingletons
  serviceLocator.registerSingleton<MovieDetailsRemoteDataSource>(
      MovieDetailsRemoteDataSourceImp());
  serviceLocator.registerSingleton<MovieDetailsRepo>(
      MovieDetailsRepoImp(serviceLocator.get<MovieDetailsRemoteDataSource>()));
  serviceLocator.registerSingleton(
      MovieDetailsCubit(serviceLocator.get<MovieDetailsRepo>()));


  // RegisterSingletons
  serviceLocator.registerSingleton<DataSource>(DataSourceImpl());
  serviceLocator.registerSingleton<RegisterRepo>(
      RegisterRepoImpl(serviceLocator.get<DataSource>()));
  serviceLocator.registerSingleton(
      RegisterCubit(registerRepo: serviceLocator.get<RegisterRepo>()));


  // // LoginSingletons
  // serviceLocator.registerSingleton<LoginDataSource>(LoginDataSourceImpl());
  // serviceLocator.registerSingleton<LoginRepo>(
  //     LoginRepoImpl(serviceLocator.get<LoginDataSource>()));
  // serviceLocator.registerSingleton(
  //     LoginCubit(loginRepo: serviceLocator.get<LoginRepo>()));

}

// final serviceLocator = di.GetIt.instance;
//
// // Global setup for the service locator
// Future<void> setUpServiceLocator() async {
//   // Movie model
//   // Registering factories
//   serviceLocator.registerFactory<MovieRemoteDataSource>(() => MovieRemoteDataSourceImp());
//   serviceLocator.registerFactory<MovieRepo>(() => MovieRepoImp(serviceLocator.get<MovieRemoteDataSource>()));
//   serviceLocator.registerFactory<MovieCubit>(() => MovieCubit(serviceLocator.get<MovieRepo>()));
//
//   // MovieDetailsSingletons
//   serviceLocator.registerFactory<MovieDetailsRemoteDataSource>(() => MovieDetailsRemoteDataSourceImp());
//   serviceLocator.registerFactory<MovieDetailsRepo>(() => MovieDetailsRepoImp(serviceLocator.get<MovieDetailsRemoteDataSource>()));
//   serviceLocator.registerFactory<MovieDetailsCubit>(() => MovieDetailsCubit(serviceLocator.get<MovieDetailsRepo>()));
// }
