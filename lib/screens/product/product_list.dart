import 'package:flutter/material.dart';

import '../../common/color.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map> myProducts =
      List.generate(20, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            "Sản phẩm nổi bật",
            style: TextStyle(
              color: AppColor.lowText,
              fontSize: 22.0,
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1,
          ),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(myProducts[index]["name"]),
            );
          },
        ),
      ],
    );
  }
}
