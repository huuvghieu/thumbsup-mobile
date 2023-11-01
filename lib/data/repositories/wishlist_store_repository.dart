import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/wish_list_store_model.dart';
import 'package:my_app/services/network_handler.dart';

class WishListStoreRepository {
  String endpoint = '${AppString.baseURL}wishlist-stores';
  static String? token;
  static List<WishListStoreModel> wishListStores = List.empty();

  Future<List<WishListStoreModel>> getWishListStores() async {
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
        wishListStores =
            result.map((e) => WishListStoreModel.fromJson(e)).toList();
        return result.map(((e) => WishListStoreModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
