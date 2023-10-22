import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/model/product.dart';

class ButtonAddToCart extends StatelessWidget {
  ButtonAddToCart(
      {super.key,
      required this.fem,
      required this.ffem,
      required this.product});

  final double fem;
  final double ffem;
  Product product;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 0 * fem),
          width: 180 * fem,
          height: 60 * fem,
          child: ElevatedButton(
              onPressed: () =>
                  // {context.read<CartBloc>().add(CartProductAdded(product))},
                  {},
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
                    padding:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
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
              ))),
    );
  }
}
