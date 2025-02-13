import '../features/home/presentation/screens/home_screen.dart';
import '../features/movie_details/presentation/screen/movie_details_screen.dart';
import '../screen/onboarding_screen.dart';
import '../screen/splash_screen.dart';

class AppRoutes {
  static const String onBoardingRoute = "OnBoardingScreen";
  static const String homeScreenRoute = "homeScreenRoute";
  static const String movieDetailsRoute = "movieDetailsRoute";
  static const String splashRoute = "splashRoute";

  static var routes = {
    splashRoute: (context) => SplashScreen(),
    onBoardingRoute: (context) => OnBoardingScreen(),
    homeScreenRoute: (context) => HomeScreen(),
    movieDetailsRoute: (context) => MovieDetailsScreen(),
  };
}
