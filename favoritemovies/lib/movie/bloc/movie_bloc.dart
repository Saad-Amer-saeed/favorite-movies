import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:favoritemovies/favorite/data/favoritedata.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/movie/data/models/movie_model.dart';
import 'package:favoritemovies/movie/data/repository/movie_repository.dart';
import 'package:favoritemovies/movie/data/web_service/web_service.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<FeachingRequsetMovieEvent>(_feachingRequsetMovie);
    on<AddingFavoriteFlim>(_addingFavoriteFlim);
  }

  FutureOr<void> _feachingRequsetMovie(
      FeachingRequsetMovieEvent event, Emitter<MovieState> emit) async {
    emit(LoadingState());
    try {
      final flimsWebServices = RequsetFlimsWebServices();
      final requsetFlimRepository = RequsetFlimRepository(flimsWebServices);
      final fetchedFilm =
          await requsetFlimRepository.geRequsetflim(event.endpoint);

      bool isInFavoriteList =
          favoriteMovie.any((film) => film.imdbID == event.endpoint);

      emit(FeachingMoviesucess(fetchedFilm, isInFavoriteList));
    } catch (e) {
      print('Error fetching film details: $e');
    }
  }

  FutureOr<void> _addingFavoriteFlim(
      AddingFavoriteFlim event, Emitter<MovieState> emit) async {
    // Check if the film is already in the favorite list
    bool isInFavoriteList =
        favoriteMovie.any((film) => film.imdbID == event.flim.imdbID);

    // Add to favorites if not already in the list
    if (!isInFavoriteList) {
      favoriteMovie.add(event.flim);
    }
  }
}
