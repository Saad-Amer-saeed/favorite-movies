import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:favoritemovies/home/widget/grid_movie.dart';
import 'package:favoritemovies/home/widget/shimmer_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc(); // Initialize the HomeBloc

  @override
  void initState() {
    super.initState();
    homeBloc.add(FeachingFlimsEvent()); // Trigger the event to fetch movies
  }

  @override
  void dispose() {
    homeBloc.close(); // Close the Bloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is FeachingDatasucess,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return ShimmerMovie();
        } else if (state is FeachingDatasucess) {
          return FavoriteMoviesScreen(films: state.films);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

void main() => runApp(MaterialApp(home: Home()));
