import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/ads_store_model.dart';
import 'package:my_app/services/ads_store_service.dart';

class CarouselStore extends StatefulWidget {
  const CarouselStore({super.key});

  @override
  State<CarouselStore> createState() => _CarouselStoreState();
}

class _CarouselStoreState extends State<CarouselStore> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<AdsStoreModel> ads = [];

  @override
  void initState() {
    super.initState();
    _fetchAds();
  }

  Future<void> _fetchAds() async {
    ads = await AdsStoreService.getAdsStore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cửa hàng nổi bật",
                style: TextStyle(
                  color: AppColor.lowText,
                  fontSize: 22.0,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => RepositoryProvider(
                  //               create: (context) => ProductRepository(),
                  //               child: ProductListScreen(products: [],),
                  //             )));
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                ),
                child: const Row(
                  children: [
                    Text(
                      "Xem thêm",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppColor.primaryDark,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.primaryDark,
                      size: 16.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              disableCenter: true,
              autoPlay: true,
              enlargeCenterPage: true,
              height: 275.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: carouselStoreWidget(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselStoreWidget().asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppColor.primaryDark)
                        .withOpacity(_current == entry.key ? 1.0 : 0.4)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  List<Widget> carouselStoreWidget() {
    return ads
        .map((item) => GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const StoreScreen(),
                //     ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.02),
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.005),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                const SizedBox(width: 2.0),
                                Text(
                                  item.numOfFollowing.toString(),
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black26),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(right: 10, bottom: 5),
                              width: 40,
                              decoration: BoxDecoration(
                                color: item.favor!
                                    ? AppColor.backgroundHeartColor
                                    : Colors.black26,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 2 ),
                                child: Container(
                                  height: 30,
                                  child: IconButton(
                                    onPressed: () {
                                      
                                    },
                                    icon: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.network(
                        item.coverPhoto.toString(),
                        fit: BoxFit.cover,
                        width: 1000.0,
                        height: 120.0,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.storeName.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w800,
                                color: AppColor.lowText,
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                flex: 1,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.local_shipping_rounded,
                                      color: AppColor.backgroundHeartColor),
                                  label: Text(
                                    "Giao hàng miễn phí",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: AppColor.lowText.withOpacity(0.7),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Expanded(
                                flex: 1,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.timer,
                                      color: AppColor.backgroundHeartColor),
                                  label: Text(
                                    "10-15 phút",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: AppColor.lowText.withOpacity(0.7),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ]),
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: item.cateList!
                                      .map(
                                        (category) => Container(
                                          padding: const EdgeInsets.all(5.0),
                                          margin: const EdgeInsets.only(
                                              right: 10.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                          ),
                                          child: Text(
                                            category,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: AppColor.lowText
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
