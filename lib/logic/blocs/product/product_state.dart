part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  ProductLoadedState(this.products);
  final List<ProductModel> products;

  @override
  List<Object> get props => [products];
}

class ProductByIdLoadedState extends ProductState {
  ProductByIdLoadedState(this.product);
  final ProductModel product;

  @override
  List<Object> get props => [product];
}

class ProductErrorState extends ProductState {
  ProductErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
