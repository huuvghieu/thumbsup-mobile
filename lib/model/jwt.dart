import 'dart:convert';

import 'package:my_app/model/customer.dart';
import 'package:my_app/model/store.dart';

class Jwt {
  String? token;
  Object? user;
  String? role;

  Jwt({this.token, this.user, this.role});

  Jwt.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    role = json['role'];
    if (role == "Customer") {
      user = json['user'] != null ? Customer.fromJson(json['user']) : null;
    } else if (role == "Store") {
      user = json['user'] != null ? Store.fromJson(json['user']) : null;
    }
  }

  Jwt.fromJsonString(Map<String, dynamic> jsonJwt) {
    token = jsonJwt['token'];
    role = jsonJwt['role'];
    if (role == "Customer") {
      user = jsonJwt['user'] != null ? Customer.fromJson(json.decode(jsonJwt['user'])) : null;
    } else if (role == "Store") {
      user = jsonJwt['user'] != null ? Store.fromJson(json.decode(jsonJwt['user'])) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['role'] = role;
    data['user'] = json.encode(user);
    return data;
  }

  @override
  String toString() {
    return user.toString();
  }
}
