import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/data/data_sources/movie_remote_data_source_imp.dart';
import 'package:movies_app/features/home/data/repositories/movie_repo_imp.dart';
import 'package:movies_app/screen/onboarding_screen.dart';
import 'package:movies_app/screen/splash_screen.dart';

import 'features/home/presentation/screens/home_screen.dart';

void main() async {
   await setUpServiceLocator();
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
        routes: {
          SplashScreen.tag: (context) => SplashScreen(),
          OnBoardingScreen.tag: (context) => OnBoardingScreen(),
          HomeScreen.tag: (context) => HomeScreen(),
          // MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
        },
        initialRoute: HomeScreen.tag
        // OnBoardingScreen.tag,
        // SplashScreen.tag,
        );
  }
}
