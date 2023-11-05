part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();
}

// class LoadGeolocation extends GeolocationEvent {
//   @override
//   List<Object?> get props => [];
// }

// class UpdateGeolocation extends GeolocationEvent {
//   final Position position;

//   const UpdateGeolocation({required this.position});
  
//   @override
//   List<Object?> get props => [position];


// }

class LoadMap extends GeolocationEvent {
  final GoogleMapController? controller;

  const LoadMap({this.controller});

  @override
  List<Object?> get props => [controller];
}

class SearchLocation extends GeolocationEvent {
  final String placeId;

  const SearchLocation({required this.placeId});

  @override
  List<Object?> get props => [placeId];
}