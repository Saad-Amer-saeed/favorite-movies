import 'package:favoritemovies/favorite/page/favorite.dart';
import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:favoritemovies/home/widget/grid_movie.dart';
import 'package:favoritemovies/home/widget/search_movie.dart';
import 'package:favoritemovies/home/widget/shimmer_movie.dart';
import 'package:favoritemovies/movie/page/movie.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(FeachingFlimsEvent('home'));
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) =>
          current is FeachingDatasucess || current is LoadingState,
      listenWhen: (previous, current) => current is NavigateToMoviePageState,
      listener: (context, state) {
        if (state is NavigateToMoviePageState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Movie(imdbID: state.imdbID),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Favorite Movies'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite_outline,
                  color: ColorManager.white,
                  size: 25.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteFlims(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              SearchMovies(homeBloc: homeBloc),
              if (state is LoadingState) Expanded(child: ShimmerMovie()),
              if (state is FeachingDatasucess)
                Expanded(
                    child: FavoriteMoviesScreen(
                  films: state.films,
                  homeBloc: homeBloc,
                )),
            ],
          ),
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(home: Home()));
