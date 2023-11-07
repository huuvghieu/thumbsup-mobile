part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}
class RefreshCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}
class AddProductEvent extends CartEvent {
  final ProductModel product;

  const AddProductEvent({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class RemoveProductEvent extends CartEvent {
  final ProductModel product;

  const RemoveProductEvent(this.product);

  @override
  List<Object> get props => [product];
}


class RemoveAllProduct extends CartEvent {
  final ProductModel product;

  const RemoveAllProduct(this.product);

  @override
  List<Object> get props => [product];
}