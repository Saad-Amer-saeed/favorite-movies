import 'package:favoritemovies/home/page/home.dart';
import 'package:favoritemovies/movie/page/movie.dart';
import 'package:favoritemovies/resources/strings_manger.dart';
import 'package:favoritemovies/splash/page/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String home = "/Home";
  static const String movie = "/movie";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => Splash());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => Home());
      // case Routes.movie:
      //   return MaterialPageRoute(builder: (_) => Movie());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.favoriteMovies),
              ),
              body: const Center(child: Text(AppStrings.favoriteMovies)),
            ));
  }
}

class ForgotPasswordView {}
