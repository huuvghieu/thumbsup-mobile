import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/store_model.dart';
import 'package:my_app/services/network_handler.dart';

class StoreRepository {
  static String endpoint = '${AppString.baseURL}stores';
  static String? token;
  static StoreModel? storeModel;

  Future<StoreModel?> getServiceProductById(int id) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endpoint/$id'), headers: headers);

      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        storeModel = StoreModel.fromJson(result);
        return storeModel;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
