import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/product/menu.dart';
import 'package:my_app/screens/product/product_list.dart';
import 'package:my_app/screens/product/search/search.dart';
import 'package:my_app/screens/product/store/store_carousel.dart';

import '../../model/store.dart';

class Product extends StatefulWidget {
  const Product({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late List<Store> stores = [];

  Future refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        drawer: Menu(onItemTapped: widget.onItemTapped),
        appBar: AppBar(
          toolbarHeight: 90.0,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leadingWidth: 70.0,
          leading: Builder(builder: (BuildContext context) {
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
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            );
          }),
          title: Center(
              child: RichText(
                  text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: "Chào mừng, ",
                style: TextStyle(
                    color: AppColor.lowText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600)),
            TextSpan(
              text: "Phạm Quốc Thịnh",
              style: TextStyle(
                  color: AppColor.primaryDark,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w800),
            )
          ]))),
          actions: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(5.0, 25.0, 10.0, 25.0),
              child: const CircleAvatar(
                backgroundColor: AppColor.primary,
                backgroundImage: AssetImage(logoImage),
                radius: 25.0,
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          color: AppColor.primaryDark,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Bạn tìm gì nè?",
                      style: TextStyle(
                        color: AppColor.lowText,
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const SearchBarCustom(),
                  const SizedBox(height: 20.0),
                  CarouselStore(stores: stores),
                  const SizedBox(height: 20.0),
                  // ListView(
                  //   // shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   children: <Widget>[
                  //     Container(
                  //       height: 50,
                  //       color: Colors.amber[600],
                  //       child: const Center(child: Text('Entry A')),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       color: Colors.amber[500],
                  //       child: const Center(child: Text('Entry B')),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       color: Colors.amber[100],
                  //       child: const Center(child: Text('Entry C')),
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       color: Colors.amber[100],
                  //       child: const Center(child: Text('Entry D')),
                  //     ),
                  //   ],
                  // ),
                  // ProductList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    stores = [
      Store(
          id: 1,
          name: "Lâm Music",
          image:
              "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixl"
              "ib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a351"
              "34a6770ed3b&auto=format&fit=crop&w=1951&q=80",
          favour: true,
          rate: 4.5,
          number: 719,
          category: ["Tai nghe", "Đồng hồ", "Chuột máy tính"]),
      Store(
          id: 2,
          name: "Thịnh Music",
          image:
              "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixli"
              "b=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3"
              "a1084d3ede&auto=format&fit=crop&w=1950&q=80",
          favour: false,
          rate: 4.8,
          number: 9999,
          category: ["Tai nghe", "Đồng hồ", "Chuột máy tính", "Bàn phím"]),
      Store(
          id: 3,
          name: "Lá ngọc cành vàng",
          image:
              "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=r"
              "b-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341"
              "ca50&auto=format&fit=crop&w=1950&q=80",
          favour: false,
          rate: 5.0,
          number: 12354,
          category: ["Chuột máy tính", "Bàn phím"]),
      Store(
          id: 4,
          name: "Happy gear",
          image:
              "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=r"
              "b-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e"
              "6efc&auto=format&fit=crop&w=1953&q=80",
          favour: true,
          rate: 3.8,
          number: 9999,
          category: ["Tai nghe", "Chuột máy tính", "Bàn phím"]),
      Store(
          id: 5,
          name: "FPT shop",
          image:
              "https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixli"
              "b=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe"
              "71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80",
          favour: true,
          rate: 3.9,
          number: 852,
          category: ["Tai nghe", "Chuột máy tính", "Bàn phím"]),
      Store(
          id: 6,
          name: "GadgetZone",
          image:
              "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ix"
              "lib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d"
              "312d9893258f59&auto=format&fit=crop&w=1355&q=80",
          favour: true,
          rate: 4.3,
          number: 602,
          category: ["Tai nghe", "Bàn phím"]),
    ];
  }
}
