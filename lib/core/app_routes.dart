import 'package:movies_app/screen/register_screen.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/movie_details/presentation/screen/movie_details_screen.dart';
import '../screen/login_screen.dart';
import '../screen/onboarding_screen.dart';
import '../screen/splash_screen.dart';

class AppRoutes {
  static const String onBoardingRoute = "OnBoardingScreen";
  static const String homeScreenRoute = "homeScreenRoute";
  static const String movieDetailsRoute = "movieDetailsRoute";
  static const String splashRoute = "splashRoute";
  static const String registerRoute = "registerRoute";
  static const String loginRoute = "loginRoute";

  static var routes = {
    splashRoute: (context) => SplashScreen(),
    onBoardingRoute: (context) => OnBoardingScreen(),
    registerRoute: (context) => RegisterScreen(),
    loginRoute: (context) => LoginScreen(),
    homeScreenRoute: (context) => HomeScreen(),
    movieDetailsRoute: (context) => MovieDetailsScreen(),
  };
}
