import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/update_data_source/upate_data_source_impl.dart';
import 'core/bloc_observer.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpServiceLocator();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  UpdateDataSourceImpl().deleteUser();
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
        initialRoute: AppRoutes.loginRoute
        // AppRoutes.splashRoute
        );
  }
}
