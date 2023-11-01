part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState extends Equatable {
  const CheckoutState();
}

class CheckoutLoadingState extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutLoadedState extends CheckoutState {

  final Cart? cart;
  const CheckoutLoadedState({this.cart});

  @override
  List<Object?> get props => [cart];
}

class CheckoutFailedState extends CheckoutState {
  @override
  List<Object?> get props => [];
}


class CheckoutSuccessState extends CheckoutState {
  @override
  List<Object?> get props => [];
}
