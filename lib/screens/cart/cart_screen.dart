import 'package:flutter/material.dart';
import 'package:my_app/screens/cart/components/body.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: Body(),  
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 90.0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      leadingWidth: 70.0,
      title:const Center(
        child: Text(
          'Giỏ hàng',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Solway',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            ),
        ),
      ),
    );
  }
}
