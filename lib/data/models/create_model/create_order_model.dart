import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/create_model/create_order_detail_model.dart';

class CreateOrderModel extends Equatable {
  double? amount;
  int? customerId;
  bool? state;
  List<CreateOrderDetailModel>? orderDetailList;

  CreateOrderModel(
      {this.amount, this.customerId, this.state, this.orderDetailList});

  @override
  List<Object?> get props => [amount, customerId, state, orderDetailList];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = amount;
    data['customerId'] = customerId;
    data['state'] = state;
    if (orderDetailList != null) {
      data['orderDetailList'] =
          orderDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
