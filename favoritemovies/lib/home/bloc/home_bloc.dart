import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:favoritemovies/home/data/repository/flim_repository.dart';
import 'package:favoritemovies/home/data/web_service/filim_web_services.dart';
import 'package:meta/meta.dart';

// Events
part 'home_event.dart';

// States
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<Loadfilmseven>(_loadfilmseven);
  }

  FutureOr<void> _loadfilmseven(
      Loadfilmseven event, Emitter<HomeState> emit) async {
    // Emit loading state to show a spinner
    emit(LoadingState());

    try {
      final flimsWebServices = FlimsWebServices();
      final flimsRepository = FlimsRepository(flimsWebServices);
      final films = await flimsRepository.getAllFlims();

      // Emit the loaded state with the retrieved data
      emit(LoadFilmsState(films));
    } catch (e) {
      // Emit an error state if fetching fails
    }
  }
}
