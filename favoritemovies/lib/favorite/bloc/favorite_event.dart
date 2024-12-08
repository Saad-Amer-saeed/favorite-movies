part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class RemoveFavoriteUserFlim extends FavoriteEvent {
  final String imdbID;

  RemoveFavoriteUserFlim(this.imdbID);
}
