part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

final class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

final class CartLoaded extends CartState {
  final Cart cart;
  const CartLoaded({required this.cart});
  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
