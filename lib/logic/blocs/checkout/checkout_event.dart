part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

// ignore: must_be_immutable
class UpdateCheckoutEvent extends CheckoutEvent {
  List<CreateOrderDetailModel>? detailLists;
  int? customerId;
  bool? state;
  double? amount;
  CheckoutModel? checkout;
  UpdateCheckoutEvent(
      {this.checkout, this.detailLists, this.customerId, this.state, this.amount});

  @override
  List<Object?> get props => [checkout, detailLists, customerId, state, amount];
}

class ConfirmCheckoutEvent extends CheckoutEvent {
  final CheckoutModel checkoutModel;

  const ConfirmCheckoutEvent({required this.checkoutModel});

  @override
  List<Object?> get props => [checkoutModel];
}
