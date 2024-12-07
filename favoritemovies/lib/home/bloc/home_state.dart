part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class FeachingDatasucess extends HomeState {
  List<Flim> films; // Assuming Film is the type of the films object
  FeachingDatasucess(this.films);
}

class NavigateToMoviePageState extends HomeState {
  final String imdbID;

  NavigateToMoviePageState({required this.imdbID});
}

class LoadingState extends HomeState {}
