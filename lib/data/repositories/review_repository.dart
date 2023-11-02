import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/review_model.dart';
import 'package:my_app/services/network_handler.dart';

class ReviewRepository {
  String endpoint = '${AppString.baseURL}reviews';
  static String? token;

  Future<bool> createReview(ReviewModel review) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };

      Map body = {
        "comment": review.comment,
        "rating": review.rating,
        "state": review.state,
        "customerId": review.customerId,
        "productId": review.productId,
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
