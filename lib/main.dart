import 'package:flutter/material.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source_imp.dart';
import 'package:movies_app/features/home/data/repositories/movie_repo_imp.dart';
import 'package:movies_app/features/movie_details/data/data_source/movie_details_remote_data_source_imp.dart';
import 'package:movies_app/screen/onboarding_screen.dart';
import 'package:movies_app/screen/splash_screen.dart';

import 'features/home/presentation/screens/home_screen.dart';
import 'features/movie_details/presentation/screen/movie_details_screen.dart';

void main() async {
   await setUpServiceLocator();
   MovieDetailsRemoteDataSourceImp().getMovieDetails(939243);
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
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.homeScreenRoute
        // AppRoutes.splashRoute
        );
  }
}
