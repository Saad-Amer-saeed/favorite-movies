import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<Anmitionsplashstart>(_anmitionsplashstart);
  }

  FutureOr<void> _anmitionsplashstart(
      Anmitionsplashstart event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 6));
    emit(SplasNavigatetoHome());
  }
}
