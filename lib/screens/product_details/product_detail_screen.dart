import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';
import 'package:my_app/screens/product_details/components/body.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.product});
  Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Body(product: product,),
      ),
    );
  }
  
}

