import 'package:flutter/material.dart';
import 'package:flutter_starter/screen/home.dart';
import 'package:flutter_starter/screen/landing.dart';
import 'package:flutter_starter/screen/login.dart';

class AppRoutes {
  static const String landing = "/landing";
  static const String login = "/login";
  static const String home = "/home";

  static final routes = {
    landing: (context) => LandingScreen(),
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    // if (settings.name == landing) {
    //   return MaterialPageRoute(builder: (context) => LandingScreen(args: args));
    // }

    return MaterialPageRoute(builder: routes[settings.name]!);
  }
}
