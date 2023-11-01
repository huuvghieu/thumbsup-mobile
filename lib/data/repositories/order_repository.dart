import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/create_model/create_order_model.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/data/models/store_model.dart';
import 'package:my_app/services/network_handler.dart';

class OrderRepository {
  static String endpoint = '${AppString.baseURL}orders';
  static String? token;
  static OrderModel? orderModel;

  Future<bool> createOrder(
      bool isPaid, CreateOrderModel createOrderModel) async {
    try {
      token = await NetWorkHandler.storage.read(key: 'token');
      final Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };

      Map body = {
        'amount': createOrderModel.amount,
        'customerId': createOrderModel.customerId,
        'state': createOrderModel.state,
        'orderDetailList': createOrderModel.orderDetailList,
      };

      http.Response response = await http.post(
          Uri.parse('$endpoint?isPaid=$isPaid&token=$token'),
          body: jsonEncode(body),
          headers: headers);

      if (response.statusCode == 201) {
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
