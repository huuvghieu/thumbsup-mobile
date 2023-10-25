import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/data/repositories/wishlist_product_repository.dart';
import 'package:my_app/data/repositories/wishlist_store_repository.dart';
import 'package:my_app/screens/wishlist/components/tab_bar_view_product.dart';
import 'package:my_app/screens/wishlist/components/tab_bar_view_store.dart';
import 'package:my_app/screens/wishlist/components/tab_bar_wishlist.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: TabBarWishList(fem: fem, ffem: ffem),
          ),
        ];
      },
      body: Container(
        padding: EdgeInsets.fromLTRB(20 * fem, 37 * fem, 20 * fem, 8 * fem),
        width: double.infinity,
        child: TabBarView(
          children: [
            RepositoryProvider(
              create: (context) => WishListRepository(),
              child: TabBarViewProduct(fem: fem, ffem: ffem),
            ),
             RepositoryProvider(
              create: (context) => WishListStoreRepository(),
              child: TabBarViewStore(fem: fem, ffem: ffem),
            ),
          ],
        ),
      ),
    );
  }
}
