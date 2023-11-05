part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();
}

// class GeoLocationLoading extends GeolocationState {
//   @override
//   List<Object?> get props => [];
// }

// class GeoLocationLoaded extends GeolocationState {
//   final Position position;

//   const GeoLocationLoaded({required this.position});
//   @override
//   List<Object?> get props => [position];
// }

class LocationLoading extends GeolocationState {
  @override
  List<Object?> get props => [];
}

class LocationLoaded extends GeolocationState {
  final Place place;
  final GoogleMapController? controller;

  LocationLoaded({
    required this.place,
    this.controller,
  });

  @override
  List<Object?> get props => [controller, place];
}
