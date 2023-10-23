import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/jwt.dart';

class LoginService {
  static const baseUrl =
      "https://thumbsup-api.azurewebsites.net/api/v1/auth/mobile/login";

  static Future<dynamic> login(String userName, String password) async {
    var response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': userName,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return Jwt.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return response.body.toString();
    }
  }
}
