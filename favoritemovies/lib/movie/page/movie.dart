import 'package:favoritemovies/favorite/page/favorite.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/movie/bloc/movie_bloc.dart';
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
  bool _isFavorite = false;
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
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.favorite_outline,
                    color: ColorManager.white, // Set the icon color to white
                    size: 25.0, // Increase the icon size
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
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: ColorManager.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                state.film.title!,
                style: TextStyle(color: ColorManager.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    state.film.image!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            state.film.title!,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                        Text(
                          state.film.year!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: ColorManager.amber),
                        const SizedBox(width: 8),
                        Text(
                          state.film.rating.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                            movieBloc.add(AddingFavoriteFlim(Flim(
                                poster: state.film.image,
                                imdbID: state.film.imdbID)));
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Writer Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Writer: ${state.film.writer}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Actors: ${state.film.actors}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Summary: ${state.film.summary}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.white.withOpacity(0.8),
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }

        return Scaffold();
      },
    );
  }
}
