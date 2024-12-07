import 'package:bloc/bloc.dart';
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
  }

  FutureOr<void> _feachingRequsetMovie(
      FeachingRequsetMovieEvent event, Emitter<MovieState> emit) async {
    emit(LoadingState());
    try {
      final flimsWebServices = RequsetFlimsWebServices();
      final requsetFlimRepository = RequsetFlimRepository(flimsWebServices);
      final fetchedFilm =
          await requsetFlimRepository.geRequsetflim(event.endpoint);
      emit(FeachingMoviesucess(fetchedFilm));
    } catch (e) {
      print('Error fetching film details: $e');
    }
  }
}
