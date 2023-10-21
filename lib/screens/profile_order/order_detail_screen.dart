import 'package:flutter/material.dart';
import 'package:my_app/screens/cart/components/cost.dart';
import 'package:my_app/screens/profile_order/components/button_back_to_home.dart';
import 'package:my_app/screens/profile_order/components/item_card.dart';
import 'package:my_app/services/product_service.dart';


class OrderDetailHistory extends StatelessWidget {
  const OrderDetailHistory({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: buildAppBar(context),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: ProductService.productLists.length,
                  itemBuilder: (context, index) {
                    return ItemCard(
                        fem: fem,
                        ffem: ffem,
                        product: ProductService.productLists[index]);
                  },
                ),
              ),
              Cost(
                fem: fem,
                ffem: ffem,
                subTotal: 1000000,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10*fem),
                width: 300*fem,
                height: 49 * fem,
                child: ButtonBackToHome(fem: fem, ffem: ffem,),
              ),
            ],
          )
        ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return AppBar(
      toolbarHeight: 100 * fem,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leadingWidth: 70.0,
      leading: Builder(builder: (BuildContext context) {
        return Container(
          height: 60 * fem,
          margin: EdgeInsets.fromLTRB(20 * fem, 5 * fem, 0 * fem, 5 * fem),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5 * fem,
                  color: Colors.black12,
                  spreadRadius: 1 * fem)
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              color: Colors.greenAccent,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 20 * fem,
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
          'Chi tiết đơn hàng',
          style: TextStyle(
            fontFamily: 'Solway',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
