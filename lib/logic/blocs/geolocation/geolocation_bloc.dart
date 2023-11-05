import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/data/models/place_model.dart';
import 'package:my_app/data/repositories/geolocation_repository.dart';
import 'package:my_app/data/repositories/place_repository.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository geolocationRepository;
  final PlacesRepository placesRepository;
  GeolocationBloc({required this.geolocationRepository, required this.placesRepository})
      : super(LocationLoading()) {
    on<LoadMap>(_onLoadMap);
    on<SearchLocation>(_onSearchLocation);
  }

  // Future<void> _onLoadLocation(LoadGeolocation event, Emitter<GeolocationState> emit) async {

  //     emit(GeoLocationLoading());
  //     final Position position =
  //         await geolocationRepository.getCurrentLocation();
  //     emit(GeoLocationLoaded(position: position));
  // }

  // Future<void> _onUpdateLocation(
  //     UpdateGeolocation event, Emitter<GeolocationState> emit) async {
  //   emit(GeoLocationLoaded(position: event.position));
  // }

    void _onLoadMap(
    LoadMap event,
    Emitter<GeolocationState> emit,
  ) async {

      final Position position =
          await geolocationRepository.getCurrentLocation();

      Place place = Place(
        lat: position.latitude,
        lon: position.longitude,
      );


    emit(
      LocationLoaded(
        controller: event.controller,
        place: place,
      ),
    );
  }

  void _onSearchLocation(
    SearchLocation event,
    Emitter<GeolocationState> emit,
  ) async {
    final state = this.state as LocationLoaded;
    final Place place = await placesRepository.getPlace(event.placeId);

    state.controller!.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(place.lat, place.lon),
      ),
    );


    emit(LocationLoaded(
      controller: state.controller,
      place: place,
    ));
  }

}
