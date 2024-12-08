import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteUserMoviesScreen extends StatelessWidget {
  final List<Flim> favoriteMovie;
  // final HomeBloc homeBloc;
  FavoriteUserMoviesScreen({
    required this.favoriteMovie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavoriteMoviesGrid(
        favoriteMovie: favoriteMovie,
      ),
    );
  }
}

class FavoriteMoviesGrid extends StatelessWidget {
  final List<Flim> favoriteMovie;

  FavoriteMoviesGrid({
    Key? key,
    required this.favoriteMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: favoriteMovie.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      // homeBloc.add(
                      //     NavigateToMoviePageEvent((films[index].imdbID!)));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        favoriteMovie[index].poster ??
                            '', // Ensure poster is not null
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child; // Image is loaded
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}