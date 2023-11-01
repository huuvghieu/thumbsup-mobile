import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/create_model/create_order_model.dart';

class CheckoutModel extends Equatable {
  final List<CreateOrderModel> orderList;
  const CheckoutModel(
      {required this.orderList});

  @override
  List<Object?> get props => [orderList];

}
