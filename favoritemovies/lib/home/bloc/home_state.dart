part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class FeachingDatasucess extends HomeState {
  List<Flim> films;
  FeachingDatasucess(this.films);
}

class NavigateToMoviePageState extends HomeState {
  final String imdbID;

  NavigateToMoviePageState({required this.imdbID});
}

class LoadingState extends HomeState {}
