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
    on<FeachingFlimsEvent>(_feachingFlims);
    on<NavigateToMoviePageEvent>(_navigateToMoviePage);
  }

  FutureOr<void> _feachingFlims(
      FeachingFlimsEvent event, Emitter<HomeState> emit) async {
    emit(LoadingState());
    print(event.endpoint);
    try {
      final flimsWebServices = FlimsWebServices();
      final flimsRepository = FlimsRepository(flimsWebServices);
      final films = await flimsRepository.getAllFlims(event.endpoint);
      emit(FeachingDatasucess(films));
    } catch (e) {}
  }

  FutureOr<void> _navigateToMoviePage(
      NavigateToMoviePageEvent event, Emitter<HomeState> emit) {
    emit(NavigateToMoviePageState());
  }
}
