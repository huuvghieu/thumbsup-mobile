import 'package:my_app/model/product.dart';
import 'package:my_app/services/product_service.dart';

class Cart {
  final Product product;
  final int numOfItems;

  Cart({
    required this.product,
    required this.numOfItems,
  });
}


   List<Cart> demoCarts = [
    Cart(product: ProductService.productLists[0], numOfItems: 2),
    Cart(product: ProductService.productLists[1], numOfItems: 1),
    Cart(product: ProductService.productLists[2], numOfItems: 1),
  ];