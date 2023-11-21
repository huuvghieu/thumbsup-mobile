import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ReviewModel extends Equatable{
  String? comment;
  int? rating;
  bool? state;
  int? customerId;
  int? productId;

  ReviewModel(
      {this.comment, this.rating, this.state, this.customerId, this.productId});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    rating = (json['rating'] as num).toInt();
    state = json['state'];
    customerId = json['customerId'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = comment;
    data['rating'] = rating;
    data['state'] = state;
    data['customerId'] = customerId;
    data['productId'] = productId;
    return data;
  }
  
  @override
  List<Object?> get props => [comment, state, rating, customerId, productId];
}