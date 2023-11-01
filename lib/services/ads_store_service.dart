import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/ads_store_model.dart';
import 'package:my_app/services/network_handler.dart';

class AdsStoreService {
  static String endpoint = '${AppString.baseURL}advertisements/ads-stores';
  static String? token;
  static List<AdsStoreModel> productLists = List.empty();

  static Future<List<AdsStoreModel>> getAdsStore() async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse('$endpoint'),
          headers: headers);

      if (response.statusCode == 200) {
        final List result =
            jsonDecode(utf8.decode(response.bodyBytes))['content'];
        productLists = result.map(((e) => AdsStoreModel.fromJson(e))).toList();
        return result.map(((e) => AdsStoreModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}