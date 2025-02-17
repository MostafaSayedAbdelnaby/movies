import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/movie_details/data/data_source/movie_details_remote_data_source_imp.dart';
import 'core/bloc_observer.dart';
import 'core/theme/app_theme.dart';
import 'features/home/data/data_sources/movie_remote_data_source_imp.dart';
import 'features/home/presentation/bloc/movie_cubit/movie_cubit.dart';


void main() async {
   await setUpServiceLocator();
   Bloc.observer = MyBlocObserver();
   serviceLocator<MovieCubit>().getMovieByGenre(28.toString());
  // WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  runApp(
      // EasyLocalization(
      //     supportedLocales: const [Locale('ar'),Locale('en')],
      //     path: 'assets/translations',
      //     fallbackLocale: const Locale('en'),
      //     child: const MyApp())
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.homeScreenRoute
        // AppRoutes.splashRoute
        );
  }
}
