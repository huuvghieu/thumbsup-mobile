import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

import '../../../model/store.dart';

class CarouselStore extends StatefulWidget {
  const CarouselStore({super.key, required this.stores});

  final List<Store> stores;

  @override
  State<CarouselStore> createState() => _CarouselStoreState();
}

class _CarouselStoreState extends State<CarouselStore> {
  int _current = 0;
  late final List<Widget> imageSliders;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    imageSliders = widget.stores
        .map((item) => Container(
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
                                item.rate.toString(),
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
                                item.number.toString(),
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black26),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding:
                                const EdgeInsets.only(right: 5.0, left: 5.0),
                            decoration: BoxDecoration(
                              color: item.favour
                                  ? AppColor.backgroundHeartColor
                                  : Colors.black26,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.favorite_rounded,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                      item.image,
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
                            item.name.toUpperCase(),
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
                                children: item.category
                                    .map(
                                      (category) => Container(
                                        padding: const EdgeInsets.all(5.0),
                                        margin:
                                            const EdgeInsets.only(right: 10.0),
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
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            "Cửa hàng nổi bật",
            style: TextStyle(
              color: AppColor.lowText,
              fontSize: 25.0,
            ),
          ),
        ),
        const SizedBox(height: 5.0),
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
          items: imageSliders,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageSliders.asMap().entries.map((entry) {
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
}
