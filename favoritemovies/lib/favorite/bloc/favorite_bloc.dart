import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteUserFlim>(_favoriteUserFlim);
  }

  FutureOr<void> _favoriteUserFlim(
      FavoriteUserFlim event, Emitter<FavoriteState> emit) async {
    Flim favoriteMovie;

    emit(FavoriteMovieUserState());
  }
}
