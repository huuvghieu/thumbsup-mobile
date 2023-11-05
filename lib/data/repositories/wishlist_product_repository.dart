import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/wish_list_model.dart';
import 'package:my_app/services/network_handler.dart';

class WishListRepository {
  String endpoint = '${AppString.baseURL}wishlist-products';
  static String? token;
  static List<WishListProductModel> wishListProducts = List.empty();

  Future<List<WishListProductModel>> getWishListProducts() async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response =
          await http.get(Uri.parse('$endpoint'), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> result =
            jsonDecode(utf8.decode(response.bodyBytes));
        wishListProducts =
            result.map(((e) => WishListProductModel.fromJson(e))).toList();
        return result.map(((e) => WishListProductModel.fromJson(e))).toList();
      } else {
        return <WishListProductModel>[];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> createWishListProduct(int customerId, int productId) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };

      Map body = {
        'customerId': customerId,
        'productId': productId,
      };

      http.Response response = await http.post(Uri.parse('$endpoint'),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        print('Create Success!');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
