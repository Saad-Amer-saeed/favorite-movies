import 'package:favoritemovies/movie/bloc/movie_bloc.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/movie/widget/MovieDetails.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Movie extends StatefulWidget {
  final String imdbID;
  const Movie({Key? key, required this.imdbID}) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  final MovieBloc movieBloc = MovieBloc();

  @override
  void initState() {
    super.initState();
    movieBloc.add(FeachingRequsetMovieEvent(widget.imdbID));
  }

  @override
  void dispose() {
    movieBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      bloc: movieBloc,
      buildWhen: (previous, current) {
        return current is FeachingMoviesucess || current is LoadingState;
      },
      listenWhen: (previous, current) {
        return current is! FeachingMoviesucess;
      },
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is FeachingMoviesucess) {
          return MovieDetails(
            flim: state.film,
            isInFavoriteList: state.isInFavoriteList,
            onFavoritePressed: () {
              setState(() {
                state.isInFavoriteList = true;
              });
              movieBloc.add(
                AddingFavoriteFlim(
                  Flim(
                    poster: state.film.image,
                    imdbID: state.film.imdbID,
                  ),
                ),
              );
            },
          );
        }

        return Scaffold();
      },
    );
  }
}
