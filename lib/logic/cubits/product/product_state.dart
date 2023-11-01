part of 'product_cubit.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;

  const ProductLoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductLoadingState extends ProductState {
  final List<ProductModel> oldProducts;
  final bool isFirstFetch;

  const ProductLoadingState({required this.oldProducts, this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldProducts, isFirstFetch];
}

class ProductErrorState extends ProductState {
  final String error;

  const ProductErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}