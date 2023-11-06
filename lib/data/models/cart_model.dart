import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/product_model.dart';

class Cart extends Equatable {
  final List<ProductModel> products;
  const Cart({required this.products});

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product.toString())) {
        quantity[product.toString()] = product;
        (product as ProductModel).quantity = 1;
      } else {
        (quantity[product.toString()] as ProductModel).quantity += 1;
      }
    });
    return quantity;
  }

  Map productStore(products) {
    Map<String?, List<ProductModel>> filterStore = {};

    products.forEach((product) {
      List<ProductModel> listItem = [];
      if (!filterStore.containsKey(product.storeName)) {
        listItem.add(product);
        filterStore[product.storeName] = listItem;
        listItem = [];
      } else {
        filterStore.forEach((key, value) {
          if (product.storeName!.contains(key!)) {
            value.add(product);
          }
        });
      }
    });
    return filterStore;
  }

  double get subTotal =>
      products.fold(0, (total, current) => total + current.salePrice);

  final double deliveryFree = 0;
  final double tax = 0;
  double total(subtotal, deliverFree, tax) {
    return subtotal + deliveryFree + tax;
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  @override
  List<Object?> get props => [products, deliveryFree, tax];
}
