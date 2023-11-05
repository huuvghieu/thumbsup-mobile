import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/repositories/wishlist_product_repository.dart';
import 'package:my_app/logic/blocs/wishlist/wishlist_bloc.dart';
import 'package:my_app/screens/wishlist/components/product_card_wishlist.dart';

class TabBarViewProduct extends StatelessWidget {
  const TabBarViewProduct({super.key, required this.fem, required this.ffem});

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WishListBloc(RepositoryProvider.of<WishListRepository>(context))
            ..add(const StartWishListEvent()),
      child: Container(
        child: Column(
          children: [
            BlocBuilder<WishListBloc, WishListState>(
              builder: (context, state) {
                if (state is WishListLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  );
                }
                if (state is WishListLoadedState) {
                  if (state.wishLists.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80*fem,),
                        Icon(
                          Icons.favorite,
                          size: 50 * fem,
                          color: AppColor.primary,
                        ),
                        Text(
                          'Không có sản phẩm \nyêu thích',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 25 * fem,
                              color: AppColor.primary),
                        ),
                      ],
                    );
                  }
                  else{
                     return Expanded(
                    child: ListView.builder(
                      itemCount: state.wishLists.length,
                      itemBuilder: (context, index) => RepositoryProvider(
                        create: (context) => WishListRepository(),
                        child: ProductCardWishList(
                          fem: fem,
                          ffem: ffem,
                          wishListProducModel: state.wishLists[index],
                        ),
                      ),
                    ),
                  );
                  }
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
