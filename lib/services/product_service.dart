import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product.dart';

class ProductService {
  static const baseUrl = "https://64eea856219b3e2873c36195.mockapi.io/product";
  static List<Product> productLists = [];

  static Future<List<Product>> getProducts(int page, int limit) async {
    var response = await http.get(Uri.parse("$baseUrl?p=$page&l=$limit"));
    List<Product> products = [];
    if (response.statusCode == 200) {
      var productsJson = json.decode(utf8.decode(response.bodyBytes));
      for (var productJson in productsJson) {
        products.add(Product.fromJson(productJson));
        productLists = products;
      }
    }
    return products;
  }
}
