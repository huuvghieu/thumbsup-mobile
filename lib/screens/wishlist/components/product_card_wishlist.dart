import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/wish_list_model.dart';
import 'package:my_app/data/repositories/wishlist_product_repository.dart';
import 'package:my_app/logic/blocs/wishlist/wishlist_bloc.dart';

class ProductCardWishList extends StatelessWidget {
  const ProductCardWishList(
      {super.key,
      required this.fem,
      required this.ffem,
      required this.wishListProducModel});

  final double fem;
  final double ffem;
  final WishListProductModel wishListProducModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListBloc(
        RepositoryProvider.of<WishListRepository>(context)
      )..add(const StartWishListEvent()),
      child: Container(
        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 20.29 * fem),
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(18.2 * fem),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x3fd3d1d8),
                offset: Offset(18.2 * fem, 18.2 * fem),
                blurRadius: 18.2 * fem,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12.29 * fem),
              width: double.infinity,
              height: 179.71 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 323 * fem,
                        height: 165.14 * fem,
                        child: Image.network(
                          '${wishListProducModel.productImage}',
                          width: 323 * fem,
                          height: 165.14 * fem,
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<WishListBloc, WishListState>(
                    builder: (context, state) {
                      if (state is WishListLoadingState) {
                        return Positioned(
                          left: 276.8 * fem,
                          top: 12.14 * fem,
                          child: Align(
                            child: SizedBox(
                                width: 34 * fem,
                                height: 34 * fem,
                               ),
                          ),
                        );
                      }
                      if (state is WishListLoadedState) {
                        return Positioned(
                          left: 276.8 * fem,
                          top: 12.14 * fem,
                          child:  Container(
                            margin: EdgeInsets.only(right: 10*fem),
                            width: 47*fem,

                              decoration: BoxDecoration(
                                color: wishListProducModel.favor!
                                    ? AppColor.backgroundHeartColor
                                    : Colors.black26,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(right: 100*fem),
                                child: IconButton(
                                  onPressed: (){
                                    
                                  },
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                  color: Colors.white,
                                  size: 32*fem,
                                  ),
                                ),
                              ))
                        );
                      }
                      if (state is AddWishListSuccessState) {
                        //                               ScaffoldMessenger.of(context)
                        // ..hideCurrentSnackBar()
                        // ..showSnackBar(SnackBar(
                        //   elevation: 0,
                        //   duration: const Duration(milliseconds: 2000),
                        //   behavior: SnackBarBehavior.floating,
                        //   backgroundColor: Colors.transparent,
                        //   content: AwesomeSnackbarContent(
                        //     title: 'Yêu thích thành công!',
                        //     message: 'Sản phẩm ${product.productName} đã được yêu thích',
                        //     contentType: ContentType.success,
                        //   ),
                        // ));
                        context.read<WishListBloc>().add(StartWishListEvent());
                      }
                      return Container();
                    },
                  ),
                  Positioned(
                    left: 13.3 * fem,
                    top: 150.5 * fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          8.5 * fem, 8.5 * fem, 4 * fem, 4.64 * fem),
                      width: 71.64 * fem,
                      height: 29.14 * fem,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(136 * fem)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x33fe724c),
                              offset: Offset(0 * fem, 6 * fem),
                              blurRadius: 12 * fem,
                            )
                          ]),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 3 * fem, 0 * fem),
                              child: Text(
                                wishListProducModel.rating.toString(),
                                style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2 * ffem / fem,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 2.5 * fem, 0 * fem),
                              width: 10.27 * fem,
                              height: 9.8 * fem,
                              child: Icon(
                                Icons.star,
                                size: 13 * fem,
                                color: Colors.yellow,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0.93 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                '(${wishListProducModel.numOfRating}+)',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 8.5 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: AppColor.kTextColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(13 * fem, 0 * fem, 0 * fem, 0 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 6 * fem),
                    child: Text(
                      wishListProducModel.productName.toString(),
                      style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 18.2 * fem,
                        fontWeight: FontWeight.w400,
                        height: 1.2 * ffem / fem,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    wishListProducModel.storeName.toString(),
                    style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 14.5 * fem,
                        fontWeight: FontWeight.w400,
                        height: 1.2 * ffem / fem,
                        color: Colors.black),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
