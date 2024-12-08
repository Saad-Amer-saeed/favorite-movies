import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:favoritemovies/favorite/data/favoritedata.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<RemoveFavoriteUserFlim>(_favoriteUserFlim);
  }

  FutureOr<void> _favoriteUserFlim(
      RemoveFavoriteUserFlim event, Emitter<FavoriteState> emit) async {
    final indexToRemove =
        favoriteMovie.indexWhere((movie) => movie.imdbID == event.imdbID);

    if (indexToRemove != -1) {
      favoriteMovie.removeAt(indexToRemove);
    }

    emit(FavoriteMovieUserState());
  }
}
