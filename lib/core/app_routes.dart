import '../features/auth/register/presentation/screens/login_screen.dart';
import '../features/auth/register/presentation/screens/register_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/home/presentation/widgets/home_screen/tabs/profile_tab/profile_tab_screen.dart';
import '../features/home/presentation/widgets/home_screen/tabs/profile_tab/up_date_profile.dart';
import '../features/movie_details/presentation/screen/movie_details_screen.dart';
import '../screen/onboarding_screen.dart';
import '../screen/splash_screen.dart';

class AppRoutes {
  static const String onBoardingRoute = "OnBoardingScreen";
  static const String homeScreenRoute = "homeScreenRoute";
  static const String movieDetailsRoute = "movieDetailsRoute";
  static const String splashRoute = "splashRoute";
  static const String registerRoute = "registerRoute";
  static const String loginRoute = "loginRoute";
  static const String updateProfileScreenRoute = "updateProfileScreenRoute";
  static const String profileTabScreenRoute = "profileTabScreenRoute";

  static var routes = {
    splashRoute: (context) => const SplashScreen(),
    profileTabScreenRoute: (context) => const ProfileTabScreen(),
    onBoardingRoute: (context) => const OnBoardingScreen(),
    registerRoute: (context) => const RegisterScreen(),
    loginRoute: (context) => LoginScreen(),
    homeScreenRoute: (context) => const HomeScreen(),
    movieDetailsRoute: (context) => const MovieDetailsScreen(),
    updateProfileScreenRoute: (context) => const UpdateProfileScreen(),
  };
}
