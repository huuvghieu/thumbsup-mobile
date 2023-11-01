import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/screens/home/home.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.fem,
    required this.ffem,
    required this.product,
    required this.quantity,
  });

  final double fem;
  final double ffem;
  final ProductModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<CartBloc>(context).add(LoadCartEvent());
    return Padding(
      padding: EdgeInsets.only(bottom: 10 * fem),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8 * fem),
            child: Image.network(
              product.imageCover.toString(),
              height: 70 * fem,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20 * fem,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180 * fem,
                      child: Padding(
                        padding: EdgeInsets.only(top: 7*fem),
                        child: Text(
                          product.productName.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'x',
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w100
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.categoryName.toString(),
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: AppColor.kTextColor,
                          ),
                        ),
                        SizedBox(
                          height: 5 * fem,
                        ),
                        Text(
                          changeCurrency(product.salePrice.toDouble() ?? 0),
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<CartBloc>()
                                          .add(RemoveProductEvent(product));
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home(index: 1)));
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15 * fem),
                                    child: Text(
                                      '$quantity',
                                      style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 13 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2 * ffem / fem,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                          AddProductEvent(product: product));
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home(index: 1)));
                                    },
                                    icon: const Icon(
                                      Icons.add_circle,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]);
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  String changeCurrency(double price) {
    return price.isNaN
        ? "0"
        : NumberFormat.currency(locale: 'vi').format(price);
  }
}
