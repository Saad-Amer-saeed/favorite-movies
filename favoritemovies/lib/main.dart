import 'package:favoritemovies/resources/routes_manager.dart';
import 'package:favoritemovies/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc(), // Initialize HomeBloc and trigger the event
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}
