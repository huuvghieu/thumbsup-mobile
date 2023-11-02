import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';

class ButtonAddToCart extends StatelessWidget {
  ButtonAddToCart({
    super.key,
    required this.fem,
    required this.ffem,
    required this.product,
  });

  final double fem;
  final double ffem;
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ProductCubit>(context).loadProducts();

    return Center(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            );
          }
          if (state is CartLoaded) {
            return Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 0 * fem),
                width: 180 * fem,
                height: 60 * fem,
                child: ElevatedButton(
                    onPressed: () => {
                          context
                              .read<CartBloc>()
                              .add(AddProductEvent(product: product)),
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              elevation: 0,
                              duration: const Duration(milliseconds: 2000),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Thêm thành công!',
                                message:
                                    'Thêm ${product.productName} vào giỏ hàng thành công!',
                                contentType: ContentType.success,
                              ),
                            ))
                        },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40 * fem)),
                        shadowColor: Colors.black,
                        backgroundColor: AppColor.primary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 10 * fem, 0 * fem),
                            width: 38 * fem,
                            height: 38 * fem,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100 * fem),
                                color: Colors.white),
                            child: Icon(
                              Icons.shopping_bag_rounded,
                              color: AppColor.primary,
                              size: 25 * fem,
                            )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: Text(
                            'Thêm vào giỏ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15 * ffem,
                                fontFamily: 'Solway'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )));
          } else {
            return Text('Có lỗi đã xảy ra ');
          }
        },
      ),
    );
  }
}
