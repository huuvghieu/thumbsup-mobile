import 'package:geolocator/geolocator.dart';

class GeolocationRepository {
  GeolocationRepository();
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
