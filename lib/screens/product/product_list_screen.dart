import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/data/models/brand_model.dart';
import 'package:my_app/data/models/category_model.dart';
import 'package:my_app/data/models/price_model.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/product_repository.dart';
import 'package:my_app/logic/cubits/product/product_cubit.dart';
import 'package:my_app/screens/product_details/product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = '/product-list-screen';
  const ProductListScreen(
      {required this.categories,
      required this.brands,
      required this.priceStart,
      required this.priceEnd,
      super.key});

  static Route route({
    required List<CategoryModel> categories,
    required List<BrandModel> brands,
    required PriceModel priceStart,
    required PriceModel priceEnd,
  }) {
    return MaterialPageRoute(
      builder: (_) => ProductListScreen(
        categories: categories,
        brands: brands,
        priceStart: priceStart,
        priceEnd: priceEnd,
      ),
      settings: RouteSettings(name: routeName),
    );
  }

  final List<CategoryModel> categories;
  final List<BrandModel> brands;
  final PriceModel priceStart;
  final PriceModel priceEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90.0,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leadingWidth: 70.0,
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: Colors.black12, spreadRadius: 1)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    color: Colors.greenAccent,
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                ),
              );
            },
          ),
          title: const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                'Kết quả tìm kiếm',
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 25,
                  color: Colors.black,
                ),
              )),
        ),
        body: BlocProvider(
          create: (context) => ProductCubit(
              ProductRepository(), categories, brands, priceStart, priceEnd),
          child: ProductView(),
        ),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  ProductView({
    super.key,
  });

  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ProductCubit>(context).loadProducts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<ProductCubit>(context).loadProducts();
    return _productList();
  }

  Widget _productList() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: ((context, state) {
        if (state is ProductLoadingState && state.isFirstFetch) {
          return _loadIndicator();
        }

        bool isLoading = false;

        List<ProductModel> products = [];

        if (state is ProductLoadingState) {
          products = state.oldProducts;
          isLoading = true;
        } else if (state is ProductLoadedState) {
          products = state.products;
        }
        return GridView.builder(
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.55, // Change the cross-axis count as needed
          ),
          itemBuilder: (context, index) {
            if (index < products.length) {
              return _product(products[index], context);
            } else {
              Timer(Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              return Container();
            }
          },
          itemCount: products.length + (isLoading ? 1 : 0),
        );
      }),
    );
  }

  Widget _loadIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColor.primary,
        ),
      ),
    );
  }

  Widget _product(ProductModel product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                product: product,
              ),
            ));
      },
      child: Hero(
        tag: 'product_${product.id}',
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: AppColor.lowText.withOpacity(0.3),
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: const Offset(
                  5.0, // Move to right 5  horizontally
                  5.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 5.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        product.imageCover.toString(),
                        fit: BoxFit.cover,
                        height: 150.0,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: SizedBox(
                        child: Stack(children: [
                          Image(
                            image: AssetImage(saleTag),
                            height: 30.0,
                          ),
                          Positioned(
                            right: 23,
                            child: Text(
                              "20",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.rating.toString(),
                            style: const TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 2.0),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                product.productName.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: AppColor.productNameColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  product.storeName!.toUpperCase().toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.productNameColor.withOpacity(0.8),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  changeCurrency(product.salePrice!.toDouble() ?? 0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: AppColor.primaryDark,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  changeCurrency(product.originalPrice!.toDouble() ?? 0),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15.0,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0,
                      fontWeight: FontWeight.w700,
                      color: AppColor.productNameColor.withOpacity(0.5)),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        size: 20.0,
                        Icons.fmd_good_sharp,
                        color: AppColor.productNameColor,
                      ),
                      Text(
                        "Cách 500m",
                        style: TextStyle(
                          fontSize: 11.0,
                          color: AppColor.productNameColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        size: 20.0,
                        Icons.view_in_ar_rounded,
                        color: AppColor.productNameColor,
                      ),
                      Text(
                        'Số lượng: ${product.quantity.toString()}',
                        style: const TextStyle(
                          fontSize: 11.0,
                          color: AppColor.productNameColor,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String changeCurrency(double price) {
    return price.isNaN
        ? "0"
        : NumberFormat.currency(locale: 'vi').format(price);
  }
}
