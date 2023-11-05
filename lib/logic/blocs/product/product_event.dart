part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProductEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class LoadProductByIdEvent extends ProductEvent {
  final int? id;
  const LoadProductByIdEvent({this.id});

  @override
  List<Object?> get props => [id];
}
