import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/product_model.dart';

class ItemCard extends StatelessWidget {
  ItemCard(
      {super.key,
      required this.fem,
      required this.ffem,
      required this.productModel,
      required this.quanity});

  final double fem;
  final double ffem;
  ProductModel productModel;
  final int quanity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15 * fem, 0 * fem, 0 * fem, 20 * fem),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            productModel.imageCover.toString(),
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 50 * fem,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 180 * fem,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5 * fem),
                  child: Text(
                    productModel.productName.toString(),
                    softWrap: true,
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
              Padding(
                padding: EdgeInsets.only(bottom: 5 * fem),
                child: Text(
                  'Số lượng: $quanity',
                  style: TextStyle(
                    fontFamily: 'Solway',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2 * ffem / fem,
                    color: AppColor.kTextColor,
                  ),
                ),
              ),
              Text(
                changeCurrency(productModel.salePrice.toDouble()),
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
