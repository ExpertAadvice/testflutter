import 'package:flutter/material.dart';
import 'package:testflutter/utils/route_utils/route_names.dart';

import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/login/login_view.dart';
import '../../ui/screens/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case RouteNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
