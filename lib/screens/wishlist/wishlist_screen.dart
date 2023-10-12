import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/wishlist/components/body.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: buildAppBar(),
          backgroundColor: Colors.white,
    
          body: Body(),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leadingWidth: 70.0,
        leading: Builder(builder: (BuildContext context) {
          return Container(
            height: 60,
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
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        }),
        title: const Center(
          child: Text(
            'Danh sách yêu thích',
            style: TextStyle(
              fontFamily: 'Solway',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
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
      );
  }
}
