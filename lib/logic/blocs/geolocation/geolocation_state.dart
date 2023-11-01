part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();
}

class GeoLocationLoading extends GeolocationState {
  @override
  List<Object?> get props => [];
}

class GeoLocationLoaded extends GeolocationState {
  final Position position;

  const GeoLocationLoaded({required this.position});
  @override
  List<Object?> get props => [position];
}
