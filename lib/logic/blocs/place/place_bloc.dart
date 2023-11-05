import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/place_model.dart';
import 'package:my_app/data/repositories/place_repository.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository placesRepository;
  PlaceBloc({required this.placesRepository}) : super(PlaceLoading()) {
    on<LoadPlace>((event, emit) async {
      emit(PlaceLoading());
      final Place place = await placesRepository.getPlace(event.placeId);
      emit(PlaceLoaded(place: place));
    });
  }
}
