import 'package:flutter/material.dart';
import 'package:my_app/screens/wishlist/components/product_cart_wishlist.dart';

class TabBarViewProduct extends StatelessWidget {
  const TabBarViewProduct({super.key, required this.fem, required this.ffem});

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProductCardWishList(fem: fem, ffem: ffem),

                    //item 2
                    ProductCardWishList(fem: fem, ffem: ffem),
                    ProductCardWishList(fem: fem, ffem: ffem),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

