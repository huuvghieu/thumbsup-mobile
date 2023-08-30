import 'package:flutter/material.dart';
import 'package:my_app/model/product.dart';
import 'package:my_app/services/product_service.dart';

import '../../common/color.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int _currentPage = 1;

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Product>> loadMoreProduct() {
    Future<List<Product>> futureProducts =
        ProductService.getProducts(_currentPage, 10);
    futureProducts.then((value) => products.addAll(value));
    return futureProducts;
  }

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
        FutureBuilder<List<Product>>(
            future: loadMoreProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else if (snapshot.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(products[index].name.toString()),
                    );
                  },
                );
              }
              return const CircularProgressIndicator(
                color: AppColor.primaryDark,
              );
            }),
      ],
    );
  }
}
