import 'package:favoritemovies/favorite/bloc/favorite_bloc.dart';
import 'package:favoritemovies/favorite/data/favoritedata.dart';
import 'package:favoritemovies/favorite/widget/grid_favorite_movie.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:favoritemovies/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteFlims extends StatelessWidget {
  final FavoriteBloc favoriteBloc = FavoriteBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      bloc: favoriteBloc,
      listener: (context, state) {},
      buildWhen: (previous, current) {
        return current is FavoriteMovieUserState;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.favorite),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: ColorManager.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: FavoriteUserMoviesScreen(
                  favoriteMovie: favoriteMovie,
                  favoriteBloc: favoriteBloc,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
