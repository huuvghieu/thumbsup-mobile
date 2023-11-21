import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/screens/product_details/product_detail_screen.dart';
import 'package:my_app/services/product_service.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/color.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  static const _pageSize = 10;

  final PagingController<int, ProductModel> _pagingController =
      PagingController(firstPageKey: 1, invisibleItemsThreshold: 2);

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() {
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

  Future<void> _getStoreById(int id) async {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  void didUpdateWidget(ProductScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return PagedSliverGrid<int, ProductModel>(
      pagingController: _pagingController,
      shrinkWrapFirstPageIndicators: true,
      showNewPageProgressIndicatorAsGridChild: false,
      showNoMoreItemsIndicatorAsGridChild: false,
      showNewPageErrorIndicatorAsGridChild: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 7.0,
        crossAxisSpacing: 7.0,
        childAspectRatio: 0.55,
      ),
      builderDelegate: PagedChildBuilderDelegate<ProductModel>(
        itemBuilder: (context, item, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      product: item,
                    ),
                  ));
            },
            child: Hero(
              tag: 'product_$index',
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
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 5.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.network(
                              item.imageCover.toString(),
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
                                    '${item.discount}',
                                    style:const  TextStyle(
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
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item.rating.toString(),
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700),
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
                      item.productName.toString(),
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
                        item.storeName!.toUpperCase().toString(),
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
                        changeCurrency(item.salePrice.toDouble()),
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
                        changeCurrency(item.originalPrice.toDouble()),
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
                                  fontSize: 10.0,
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
                                'Số lượng: ${item.quantity.toString()}',
                                style: const TextStyle(
                                  fontSize: 10.0,
                                  color: AppColor.productNameColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
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
    );
  }

  Widget shimmerLoading() {
    return GridView.builder(
      itemCount: _pageSize,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 7.0,
        crossAxisSpacing: 7.0,
        childAspectRatio: 0.5,
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
