part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

class FeachingMoviesucess extends MovieState {
  RequsetFlim film; // Assuming Film is the type of the films object
  bool isInFavoriteList;
  FeachingMoviesucess(this.film, this.isInFavoriteList);
}
// class AddFavoriteList extends MovieState {
//   Flim film; // Assuming Film is the type of the films object
//   AddFavoriteList(this.film);
// }

class LoadingState extends MovieState {}

class ToglebuttonState extends MovieState {}
