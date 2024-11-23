import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signUp_view.dart';
import 'package:mvvm/view/splash_Screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Splash_Screen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Home_screen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Login_Screen());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Signup_Screen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No routes define'),
                  ),
                ));
    }
  }
}
