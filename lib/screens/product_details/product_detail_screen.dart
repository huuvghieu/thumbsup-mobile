import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/store_repository.dart';
import 'package:my_app/data/repositories/wishlist_product_repository.dart';
import 'package:my_app/screens/product_details/components/body.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => StoreRepository(),
            ),
            RepositoryProvider(
              create: (context) => WishListRepository(),
            ),
          ],
          child: Body(
            product: product,
          ),
        ),
      ),
    );
  }
}
