import 'package:flutter/material.dart';
import 'package:my_app/data/models/product_model.dart';

class ItemCard extends StatelessWidget {
   ItemCard({
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
    return Padding(
      padding: EdgeInsets.fromLTRB(0 * fem, 15 * fem, 0 * fem, 10 * fem),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 80*fem,
            child: Text(
              product.productName.toString(),
              style: TextStyle(
                fontFamily: 'Solway',
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2 * ffem / fem,
                color: Colors.black,
              ),
              softWrap: true,
            ),
          ),
          Text(
            product.quantity.toString(),
            style: TextStyle(
                fontFamily: 'Solway',
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2 * ffem / fem,
                color: Colors.black,
              ),
          ),
          Text(
            product.salePrice.toString(),
            style: TextStyle(
                fontFamily: 'Solway',
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2 * ffem / fem,
                color: Colors.black,
              ),
          ),
        ],
      ),
    );
  }
}
