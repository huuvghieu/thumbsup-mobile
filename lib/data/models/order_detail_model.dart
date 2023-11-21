import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OrderDetailModel extends Equatable {
  final int id;
  double? originalPrice;
  double? discount;
  double? salePrice;
  int? quantity;
  double? amount;
  bool? state;
  final int orderId;
  final int productId;
  String? productName;
  String? productImage;
  bool? status;

  OrderDetailModel(
      {required this.id,
      this.originalPrice,
      this.discount,
      this.salePrice,
      this.quantity,
      this.amount,
      this.state,
      required this.orderId,
      required this.productId,
      this.productName,
      this.productImage,
      this.status});

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailModel(
      id: json['id'],
      originalPrice: json['originalPrice'],
      discount: json['discount'],
      salePrice: json['salePrice'],
      quantity: json['quantity'],
      amount: json['amount'],
      state: json['state'],
      orderId: json['orderId'],
      productId: json['productId'],
      productName: json['productName'],
      productImage: json['productImage'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['originalPrice'] = originalPrice;
    data['discount'] = discount;
    data['salePrice'] = salePrice;
    data['quantity'] = quantity;
    data['amount'] = amount;
    data['state'] = state;
    data['orderId'] = orderId;
    data['productId'] = productId;
    data['productName'] = productName;
    data['productImage'] = productImage;
    data['status'] = status;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        originalPrice,
        discount,
        salePrice,
        quantity,
        amount,
        state,
        orderId,
        productId,
        productName,
        productImage,
        status,
      ];
}
