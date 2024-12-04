part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

abstract class SplashActionState extends SplashState {}

class SplasNavigatetoHome extends SplashActionState {}
