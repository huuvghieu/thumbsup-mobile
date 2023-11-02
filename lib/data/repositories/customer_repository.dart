import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/services/network_handler.dart';

class CustomerRepository {
  static String endpoint = '${AppString.baseURL}customers';
  static String? token;
  static List<OrderModel> orderList = List.empty();

  Future<void> registerCustomer({
    required String userName,
    required String passWord,
    required String passWordConfirmed,
    required String fullName,
    required String email,
    required String phone,
    required String dob,
    required int cityId,
    required List<int> selectedFile,
    required Uint8List bytesData,
    required String filename,
  }) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('{$endpoint}auth/customer/register'));

      //thêm file cho request
      request.files.add(await http.MultipartFile.fromBytes(
          'avatar', selectedFile!,
          filename: filename, contentType: MediaType('image', 'png')));

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
        'cityId': cityId.toString(),
      });
      //send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        print(response);
      } else {
        throw Exception(response.reasonPhrase);
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
          Uri.parse('$endpoint/$id/orders?sort=id%2Cdesc'),
          headers: headers);

      if (response.statusCode == 200) {
        final List result =
            jsonDecode(utf8.decode(response.bodyBytes))['content'];

        orderList = result.map((json) => OrderModel.fromJson(json)).toList();
        return orderList;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
