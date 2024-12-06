import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:favoritemovies/home/widget/grid_movie.dart';
import 'package:favoritemovies/home/widget/search_movie.dart';
import 'package:favoritemovies/home/widget/shimmer_movie.dart';
import 'package:favoritemovies/resources/color_manager.dart';
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
    homeBloc
        .add(FeachingFlimsEvent('home')); // Trigger the event to fetch movies
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
      buildWhen: (previous, current) =>
          current is FeachingDatasucess || current is LoadingState,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Favorite Movies'),
          ),
          body: Column(
            children: [
              SearchMovies(homeBloc: homeBloc),

              if (state is LoadingState)
                Expanded(child: ShimmerMovie()), // Show shimmer loading
              if (state is FeachingDatasucess)
                Expanded(
                    child:
                        FavoriteMoviesScreen(films: state.films)), // Show films
              // Show empty space if no data
            ],
          ),
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(home: Home()));
