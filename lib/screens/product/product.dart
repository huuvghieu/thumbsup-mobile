import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/product/menu.dart';
import 'package:my_app/screens/product/search/search.dart';
import 'package:my_app/screens/product/store/store_carousel.dart';

class Product extends StatefulWidget {
  const Product({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        drawer: Menu(onItemTapped: widget.onItemTapped),
        appBar: AppBar(
          toolbarHeight: 100.0,
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
          title: const Center(
            child: Text(
              "Welcome, Phạm Quốc Thịnh",
              style: TextStyle(
                  color: AppColor.lowText,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
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
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Bạn tìm gì nè?",
                    style: TextStyle(
                      color: AppColor.lowText,
                      fontSize: 35.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                SearchBarCustom(),
                SizedBox(height: 30.0),
                CarouselStore(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
