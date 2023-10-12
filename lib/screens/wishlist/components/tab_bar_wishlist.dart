import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

class TabBarWishList extends StatelessWidget {
  const TabBarWishList({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20 * fem,
          ),
          Center(
            child: Container(
              width: 350 * fem,
              height: 60 * fem,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xfff2eaea)),
                borderRadius: BorderRadius.all(
                  Radius.circular(50 * fem),
                ),
              ),
              child: TabBar(
                padding: EdgeInsets.all(4 * fem),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50 * fem),
                  ),
                  color: AppColor.primary,
                ),
                unselectedLabelColor: AppColor.primary,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Container(
                      width: 150 * fem,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        'Sản phẩm',
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 17 * ffem,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 150 * fem,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        'Cửa hàng',
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 17 * ffem,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}