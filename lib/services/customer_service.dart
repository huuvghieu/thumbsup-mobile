import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/customer.dart';

class CustomerService {
  static const baseUrl =
      "https://thumbsup-api.azurewebsites.net/api/v1/customers";

  static Future<dynamic> getCustomerById(String token, int customerId) async {
    var response = await http.get(
      Uri.parse("$baseUrl/$customerId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return Customer.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return response.body.toString();
    }
  }
}
