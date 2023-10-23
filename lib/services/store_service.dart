import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/store_extra.dart';

class StoreService {
  static const baseUrl =
      "https://thumbsup-api.azurewebsites.net/api/v1/stores";

  static Future<dynamic> getStoreById(String token, int storeId) async {
    var response = await http.get(
      Uri.parse("$baseUrl/$storeId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return StoreExtra.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return response.body.toString();
    }
  }
}
