part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

class FeachingMoviesucess extends MovieState {
  RequsetFlim film; // Assuming Film is the type of the films object
  FeachingMoviesucess(this.film);
}

class LoadingState extends MovieState {}
