import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/screen/home_screen/home_screen.dart';
import 'package:movies_app/screen/onboarding_screen.dart';
import 'package:movies_app/screen/splash_screen.dart';

void main()  {
  ApiHelper().getMovies();
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
        },
        initialRoute: HomeScreen.tag
        // OnBoardingScreen.tag,
        // SplashScreen.tag,
        );
  }
}
