import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/customer.dart';
import 'package:my_app/model/jwt.dart';
import 'package:my_app/services/network_handler.dart';

class LoginService {
  static const baseUrl =
      "https://thumbsup-api.azurewebsites.net/api/v1/auth/mobile";

  static Future<dynamic> login(String userName, String password) async {
    var response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': userName,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final result = Jwt.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      String token = result.token.toString();
      Customer user = (result.user as Customer);
      NetWorkHandler.storeToken(token);
      NetWorkHandler.storeId(user.id);
      return Jwt.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return response.body.toString();
    }
  }

  static Future<dynamic> loginWithGoogle(
      String idToken, String clientId, String clientSecret) async {
    var response = await http.post(
      Uri.parse("$baseUrl/google/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'idToken': idToken,
        'clientId': clientId,
        'clientSecret': clientSecret,
      }),
    );
    if (response.statusCode == 200) {
      final result = Jwt.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      String token = result.token.toString();
      Customer user = (result.user as Customer);
      NetWorkHandler.storeToken(token);
      NetWorkHandler.storeId(user.id);
      return Jwt.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return response.body.toString();
    }
  }
}
