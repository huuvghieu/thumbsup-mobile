import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_app/data/repositories/geolocation_repository.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository geolocationRepository;

  GeolocationBloc({required this.geolocationRepository})
      : super(GeoLocationLoading()) {
    on<GeolocationEvent>((event, emit) {});
  }
}
