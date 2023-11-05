import 'package:my_app/data/models/place_autocomplete.dart';
import 'package:my_app/data/models/place_model.dart';

class PlacesRepository {
  final String key = 'AIzaSyDtBHIOWL2deVmyfnR4AMzq6yUhokXiTGU';
  final String types = 'geocode';

  get http => null;

  get convert => null;

  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    print(response);
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['result'] as Map<String, dynamic>;

    return Place.fromJson(results);
  }
}
