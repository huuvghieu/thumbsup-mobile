import 'package:equatable/equatable.dart';
import 'package:my_app/model/product.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double get subTotal =>
      products.fold(0, (total, current) => total + current.unitPrice!);

  String get subTotalString => subTotal.toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
