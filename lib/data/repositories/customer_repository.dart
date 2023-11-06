import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/services/network_handler.dart';

class CustomerRepository {
  static String endpoint = '${AppString.baseURL}';
  static String? token;
  static List<OrderModel> orderList = List.empty();

  Future<bool> registerCustomer({
    required String userName,
    required String passWord,
    required String passWordConfirmed,
    required String fullName,
    required String email,
    required String phone,
    required String dob,
    required String address,
    required int cityId,
    required File avatar,
  }) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${endpoint}auth/customer/register'));

      //thêm file cho request
      request.files.add(await http.MultipartFile.fromPath(
        'avatar',
        avatar.path,
      ));

      //thêm headers
      request.headers.addAll(headers);

      //thêm field cho request
      request.fields.addAll({
        'userName': userName,
        'password': passWord,
        'passwordConfirmed': passWordConfirmed,
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'dob': dob,
        'address': address,
        'cityId': cityId.toString(),
      });
      //send the request
      var response = await request.send();

      if (response.statusCode == 201) {
        print(response);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<OrderModel>?> getOrderListByCustomerId(int id) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      http.Response response = await http.get(
          Uri.parse('$endpoint/customers/$id/orders?sort=id%2Cdesc'),
          headers: headers);

      if (response.statusCode == 200) {
        final List result =
            jsonDecode(utf8.decode(response.bodyBytes))['content'];

        orderList = result.map((json) => OrderModel.fromJson(json)).toList();
        return orderList;
      } else {
        return <OrderModel>[];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
