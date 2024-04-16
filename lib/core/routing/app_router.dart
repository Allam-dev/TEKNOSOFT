import 'package:flutter/material.dart';
import 'package:shopink/features/login/ui/login_screen.dart';
import 'package:shopink/features/signup/ui/signup_screen.dart';
import 'package:shopink/features/splash/splash.dart';
import 'package:shopink/tests_screen.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case Routes.testsRoute:
        return MaterialPageRoute(builder: (context) => const TestsScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
