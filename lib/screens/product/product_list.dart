import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/model/product.dart';
import 'package:my_app/services/product_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../common/color.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  static const _pageSize = 14;

  final PagingController<int, Product> _pagingController =
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

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ProductService.getProducts(pageKey, _pageSize);
      print(pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = ++pageKey;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void didUpdateWidget(ProductList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid<int, Product>(
      pagingController: _pagingController,
      shrinkWrapFirstPageIndicators: true,
      showNewPageProgressIndicatorAsGridChild: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.55,
      ),
      builderDelegate: PagedChildBuilderDelegate<Product>(
        itemBuilder: (context, item, index) {
          return GestureDetector(
            onTap: () {
              print(item.name);
            },
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
                            item.image.toString(),
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
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "5.0",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(width: 2.0),
                              Icon(
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
                    item.name.toString(),
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
                      item.store!.toUpperCase().toString(),
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
                      changeCurrency(item.unitPrice ?? 0),
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
                      changeCurrency(item.unitPrice ?? 0),
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                          Icon(
                            size: 20.0,
                            Icons.view_in_ar_rounded,
                            color: AppColor.productNameColor,
                          ),
                          Text(
                            "Số lượng: 100",
                            style: TextStyle(
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
          );
        },
        animateTransitions: true,
        newPageProgressIndicatorBuilder: (context) {
          return shimmerLoading();
        },
        firstPageProgressIndicatorBuilder: (context) {
          return shimmerLoading();
        },
      ),
    );
  }

  Widget shimmerLoading() {
    return GridView.builder(
      itemCount: _pageSize,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 8.0,
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
