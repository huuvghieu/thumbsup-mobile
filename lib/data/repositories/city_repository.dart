import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/city_model.dart';
import 'package:my_app/services/network_handler.dart';

class CityRepository {
  static String endpoint = '${AppString.baseURL}cities';
  static String? token;
  static List<CityModel>? cityModels;

  Future<List<CityModel>?> getCities() async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endpoint'), headers: headers);

      if (response.statusCode == 200) {
        final List result = jsonDecode(utf8.decode(response.bodyBytes))['content'];
        cityModels = result.map((e) => CityModel.fromJson(e)).toList();
        return cityModels;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
