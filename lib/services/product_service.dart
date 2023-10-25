import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/services/network_handler.dart';

class ProductService {
  static String endpoint = '${AppString.baseURL}products';
  static String? token;
  static List<ProductModel> productLists = List.empty();

  static Future<List<ProductModel>> getProducts(int page, int limit) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse('$endpoint?page=$page&limit=$limit'),
          headers: headers);

      if (response.statusCode == 200) {
        final List result =
            jsonDecode(utf8.decode(response.bodyBytes))['content'];
        productLists = result.map(((e) => ProductModel.fromJson(e))).toList();
        return result.map(((e) => ProductModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
