import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CreateOrderDetailModel extends Equatable{
  double? originalPrice;
  int? discount;
  double? salePrice;
  int? quantity;
  double? amount;
  bool? state;
  int? productId;

  CreateOrderDetailModel({
    this.originalPrice,
    this.discount,
    this.quantity,
    this.salePrice,
    this.amount,
    this.state,
    this.productId
  });
  
  @override
  List<Object?> get props => [
    originalPrice,
    discount,
    quantity,
    salePrice,
    amount,
    state,
    productId
  ];

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['originalPrice'] = originalPrice;
    data['discount'] = discount;
    data['salePrice'] = salePrice;
    data['quantity'] = quantity;
    data['amount'] = amount;
    data['state'] = state;
    data['productId'] = productId;
    return data;
  }
}
