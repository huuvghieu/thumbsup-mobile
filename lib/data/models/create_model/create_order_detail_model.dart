import 'package:equatable/equatable.dart';

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
    data['originalPrice'] = this.originalPrice;
    data['discount'] = this.discount;
    data['salePrice'] = this.salePrice;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['state'] = this.state;
    data['productId'] = this.productId;
    return data;
  }
}
