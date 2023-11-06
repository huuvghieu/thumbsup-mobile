import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/data/models/price_model.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/product_repository.dart';
import 'package:my_app/logic/cubits/product/product_cubit.dart';
import 'package:my_app/screens/product_details/product_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class ProductListSearchScreen extends StatelessWidget {
  static const String routeName = '/product-list-search-screen';

  const ProductListSearchScreen(
      {required this.searchString,
      super.key});

  static Route route({
    required String searchString,
  }) {
    return MaterialPageRoute(
      builder: (_) => ProductListSearchScreen(
        searchString: searchString,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  final String searchString;


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
              ProductRepository(), [], [], PriceModel(id: 0, price: 0), PriceModel(id: 0, price: 10000000),searchString),
          child: Container(
              margin: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
              child: const ProductView()),
        ),
      ),
    );
  }
}

class ProductView extends StatefulWidget {
  const ProductView({
    super.key,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  //PQT
  final PagingController<int, ProductModel> _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 2);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }
  //PQT

  Future<void> _fetchPage(int pageKey) async {
    BlocProvider.of<ProductCubit>(context).loadSearchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return _productList();
  }

  Widget _productList() {
    return BlocBuilder<ProductCubit, ProductState>(builder: ((context, state) {
      int page = 1;

      if (state is ProductLoadedState) {
        try {
          final newItems = state.products;
          final isLastPage = newItems.length < 10;
          if (isLastPage) {
            _pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = page;
            _pagingController.appendPage(newItems, nextPageKey);
          }
        } catch (error) {
          _pagingController.error = error;
        }
      }

      return CustomScrollView(slivers: <Widget>[
        PagedSliverGrid<int, ProductModel>(
          pagingController: _pagingController,
          shrinkWrapFirstPageIndicators: true,
          showNewPageProgressIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          showNewPageErrorIndicatorAsGridChild: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.55,
          ),
          builderDelegate: PagedChildBuilderDelegate<ProductModel>(
            itemBuilder: (context, item, index) {
              return _product(item, context);
            },
            animateTransitions: true,
            newPageProgressIndicatorBuilder: (context) {
              return shimmerLoading();
            },
            firstPageProgressIndicatorBuilder: (context) {
              return shimmerLoading();
            },
            noItemsFoundIndicatorBuilder: (context) {
              return const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(emptyIcon),
                        height: 50.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Không tìm thấy sản phẩm!",
                        style: TextStyle(
                            color: AppColor.lowText,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]);
    }));
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: SizedBox(
                        child: Stack(children: [
                          const Image(
                            image: AssetImage(saleTag),
                            height: 30.0,
                          ),
                          Positioned(
                            right: 23,
                            child: Text(
                              '${product.discount}',
                              style: const TextStyle(
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

  Widget shimmerLoading() {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      },
    );
  }

  String changeCurrency(double price) {
    return price.isNaN
        ? "0"
        : NumberFormat.currency(locale: 'vi').format(price);
  }
}
