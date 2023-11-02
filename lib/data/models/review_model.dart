import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable{
  String? comment;
  double? rating;
  bool? state;
  int? customerId;
  int? productId;

  ReviewModel(
      {this.comment, this.rating, this.state, this.customerId, this.productId});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    rating = json['rating'];
    state = json['state'];
    customerId = json['customerId'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    data['state'] = this.state;
    data['customerId'] = this.customerId;
    data['productId'] = this.productId;
    return data;
  }
  
  @override
  List<Object?> get props => [comment, state, rating, customerId, productId];
}