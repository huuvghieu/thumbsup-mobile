import 'package:flutter/material.dart';

import '../../common/color.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
                "Sản phẩm nổi bật",
                style: TextStyle(
                  color: AppColor.lowText,
                  fontSize: 22.0,
                ),
              ),
        ),
      ],
    );
  }
}
