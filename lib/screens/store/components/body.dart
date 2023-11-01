import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/product/product_list_screen.dart';
import 'package:my_app/screens/product/product_screen.dart';
import 'package:my_app/screens/store/screens/review_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return CustomScrollView(slivers: <Widget>[
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170 * fem,
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20 * fem, 0 * fem, 20 * fem, 0 * fem),
              child: Image.asset(
                'assets/images/lam-music-store.png',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0 * fem, 15 * fem, 0 * fem, 0 * fem),
                  child: Image.asset(
                    'assets/images/lamvu-store.png',
                    width: 170 * fem,
                    height: 50 * fem,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15 * fem),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LÂM MUSIC',
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 20 * ffem,
                          height: 1.2 * ffem / fem,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5 * fem),
                        width: 180 * fem,
                        child: Text(
                          'Địa chỉ: 606/59 đường 3 tháng 2, F14, Q10,HCM',
                          softWrap: true,
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 15 * ffem,
                            height: 1.2 * ffem / fem,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(0 * fem, 15 * fem, 10 * fem, 0 * fem),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReviewScreen()));
                  },
                  child: Text(
                    'Đánh giá',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      color: AppColor.primary,
                      fontStyle: FontStyle.italic,
                      fontSize: 20 * ffem,
                      height: 1.2 * ffem / fem,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.primary,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(20 * fem, 20 * fem, 0 * fem, 0 * fem),
                  child: Text(
                    'Sản phẩm phổ biến',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 20 * ffem,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0 * fem, 10 * fem, 10 * fem, 0 * fem),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Xem thêm',
                            style: TextStyle(
                              fontFamily: 'Solway',
                              color: AppColor.primary,
                              fontSize: 14 * ffem,
                              height: 1.2 * ffem / fem,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColor.primary,
                            size: 13 * fem,
                          )
                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
      ProductScreen()
    ]);
  }
}
