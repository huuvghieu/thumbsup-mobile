import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/order_detail_model.dart';
import 'package:my_app/data/models/state_detail_list_model.dart';

// ignore: must_be_immutable
class OrderModel extends Equatable {
  final int id;
  double? amount;
  String? dateCreated;
  final int customerId;
  String? customerName;
  bool? state;
  bool? status;
  int? storeId;
  String? storeName;
  String? stateCurrent;
  List<OrderDetailModel>? orderDetailList;
  List<StateDetailListModel>? stateDetailList;

  OrderModel(
      {required this.id,
      this.amount,
      this.dateCreated,
      required this.customerId,
      this.customerName,
      this.storeId,
      this.storeName,
      this.state,
      this.status,
      this.stateCurrent,
      this.orderDetailList,
      this.stateDetailList});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    var orderDetailList = json['orderDetailList'] as List<dynamic>;
    List<OrderDetailModel> orderDetails = orderDetailList
        .map((detail) => OrderDetailModel.fromJson(detail))
        .toList();

    var stateDetailList = json['stateDetailList'] as List<dynamic>;
    List<StateDetailListModel> stateDetails = stateDetailList
        .map((detail) => StateDetailListModel.fromJson(detail))
        .toList();
    return OrderModel(
      id: json['id'],
      amount: (json['amount'] as num).toDouble(),
      dateCreated: json['dateCreated'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      state: json['state'],
      status: json['status'],
      storeId: json['storeId'],
      storeName: json['storeName'],
      stateCurrent: json['stateCurrent'],
      orderDetailList: orderDetails,
      stateDetailList: stateDetails,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['amount'] = amount;
    data['dateCreated'] = dateCreated;
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['state'] = state;
    data['status'] = status;
    data['storeId'] = storeId;
    data['storeName'] = storeName;
    data['stateCurrent'] = stateCurrent;
    if (orderDetailList != null) {
      data['orderDetailList'] =
          orderDetailList!.map((v) => v.toJson()).toList();
    }
    if (stateDetailList != null) {
      data['stateDetailList'] =
          stateDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        amount,
        dateCreated,
        customerId,
        customerName,
        state,
        status,
        stateCurrent,
        orderDetailList,
        stateDetailList
      ];
}
