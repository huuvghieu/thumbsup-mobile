import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/brand_model.dart';
import 'package:my_app/data/models/category_model.dart';
import 'package:my_app/data/models/price_model.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/services/network_handler.dart';

class ProductRepository {
  static String endpoint = '${AppString.baseURL}products';
  static String? token;
  static List<ProductModel> productLists = [];

  Future<List<ProductModel>> getProducts(int page) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endpoint?page=$page'), headers: headers);

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

  Future<List<ProductModel>> filteredProducts(
    int page,
    List<CategoryModel> cateList,
    List<BrandModel> brandList,
    PriceModel priceStart,
    PriceModel priceEnd,
  ) async {
    try {
      String filterCateId = '';
      String filterBrandId = '';
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };

      if (cateList.isNotEmpty) {
        for (int i = 0; i < cateList.length; i++) {
          if (i == cateList.length - 1) {
            filterCateId = '${filterCateId}categoryIds=${cateList[i].id}';
          } else {
            filterCateId = '${filterCateId}categoryIds=${cateList[i].id}&';
          }
        }
      }

      if (brandList.isNotEmpty) {
        for (int i = 0; i < brandList.length; i++) {
          if (i == cateList.length - 1) {
            filterBrandId = '$filterBrandId&brandIds=${brandList[i].id}';
          } else {
            filterBrandId = '$filterBrandId&brandIds=${brandList[i].id}&';
          }
        }
      }

      http.Response response = await http.get(
          Uri.parse(
              '$endpoint?sort=id%2Cdesc&page=$page&$filterCateId$filterBrandId'),
          headers: headers);

      if (response.statusCode == 200) {
        final List result =
            jsonDecode(utf8.decode(response.bodyBytes))['content'];
        productLists = result.map(((e) => ProductModel.fromJson(e))).toList();
        // if (priceStart != null && priceEnd != null) {
        //   productLists = productLists.where((product) {
        //     return priceStart.price <= product.salePrice &&
        //         product.salePrice <= priceEnd.price;
        //   }).toList();
        // }
        return productLists;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
