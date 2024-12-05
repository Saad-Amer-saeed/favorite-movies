part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FeachingFlimsEvent extends HomeEvent {
  final String endpoint;

  FeachingFlimsEvent(this.endpoint);
}
