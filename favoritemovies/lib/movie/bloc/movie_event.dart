part of 'movie_bloc.dart';

@immutable
sealed class MovieEvent {}

class FeachingRequsetMovieEvent extends MovieEvent {
  final String endpoint;

  FeachingRequsetMovieEvent(this.endpoint);
}
