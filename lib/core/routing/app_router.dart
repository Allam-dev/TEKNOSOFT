import 'package:flutter/material.dart';
import 'package:shopink/layers/presentation/home/ui/home_screen.dart';
import 'package:shopink/layers/presentation/login/ui/login_screen.dart';
import 'package:shopink/layers/presentation/main/main_layout.dart';
import 'package:shopink/layers/presentation/profile/profile_screen.dart';
import 'package:shopink/layers/presentation/signup/ui/signup_screen.dart';
import 'package:shopink/layers/presentation/splash/splash.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Routes.mainLayoutRoute:
        return MaterialPageRoute(
          builder: (context) => const MainLayout(),
        );

      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

        

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
