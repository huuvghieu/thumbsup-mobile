import 'package:equatable/equatable.dart';

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
    data['id'] = this.id;
    data['originalPrice'] = this.originalPrice;
    data['discount'] = this.discount;
    data['salePrice'] = this.salePrice;
    data['quantity'] = this.quantity;
    data['amount'] = this.amount;
    data['state'] = this.state;
    data['orderId'] = this.orderId;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['status'] = this.status;
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
