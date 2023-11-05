import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/repositories/wishlist_store_repository.dart';
import 'package:my_app/logic/blocs/wishlist_store/wish_list_store_bloc.dart';
import 'package:my_app/screens/wishlist/components/store_card_wishlist.dart';

class TabBarViewStore extends StatelessWidget {
  const TabBarViewStore({super.key, required this.fem, required this.ffem});

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
 return BlocProvider(
      create: (context) =>
          WishListStoreBloc(RepositoryProvider.of<WishListStoreRepository>(context))
            ..add(const StartWishListStoreEvent()),
      child: Container(
        child: Column(
          children: [
            BlocBuilder<WishListStoreBloc, WishListStoreState>(
              builder: (context, state) {
                if (state is WishListStoreLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  );
                }
                if (state is WishListStoreLoadedState) {
                 if(state.wishLists.isEmpty){
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
                          'Không có cửa hàng \nyêu thích',
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
                      itemBuilder: (context, index) => StoreCardWishList(
                        fem: fem,
                        ffem: ffem,
                        wishListStoreModel: state.wishLists[index],
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
