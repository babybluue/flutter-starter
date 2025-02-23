import 'package:flutter/material.dart';
import 'package:flutter_starter/src/screen/onboard.dart';
import 'package:flutter_starter/src/screen/landing.dart';
import 'package:flutter_starter/src/screen/login.dart';

class AppRoutes {
  static const String landing = "/landing";
  static const String login = "/login";
  static const String onboard = "/onboard";
  static const String home = "/home";

  static final routes = {
    landing: (context) => LandingScreen(),
    login: (context) => LoginScreen(),
    onboard: (context) => OnBoardScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    // if (settings.name == landing) {
    //   return MaterialPageRoute(builder: (context) => LandingScreen(args: args));
    // }

    return MaterialPageRoute(builder: routes[settings.name]!);
  }
}
