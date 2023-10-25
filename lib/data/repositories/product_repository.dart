import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/services/network_handler.dart';

class ProductRepository {
   String endpoint = '${AppString.baseURL}/products}';
   Future<String?> token = NetWorkHandler.getToken();

   Future<List<ProductModel>> getProducts(
      ) async {
    try {
      http.Response response = await http.get(
          Uri.parse('${endpoint}'),
          headers: {'Authorization': 'Bearer ${token.toString()}'});
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['content'];
        return result.map(((e) => ProductModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
