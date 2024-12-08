import 'package:favoritemovies/favorite/data/favoritedata.dart';
import 'package:favoritemovies/favorite/widget/grid_favorite_movie.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:favoritemovies/resources/strings_manger.dart';
import 'package:flutter/material.dart';

class FavoriteFlims extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(favoriteMovie);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.favorite),
      ),
      body: Column(
        children: [
          Expanded(
              child: FavoriteUserMoviesScreen(
            favoriteMovie: favoriteMovie,
            // homeBloc: homeBloc,
          )),
        ],
      ),
    );
  }
}
