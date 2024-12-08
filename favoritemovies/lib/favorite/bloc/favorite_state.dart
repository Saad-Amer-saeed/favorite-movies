part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteMovieUserState extends FavoriteState {
  // Property to hold the favorite movie

  // Constructor to pass the favoriteMovie
}
