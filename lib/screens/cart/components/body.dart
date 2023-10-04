import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/cart/components/button_pay.dart';
import 'package:my_app/screens/cart/components/button_reserve.dart';
import 'package:my_app/screens/cart/components/cost.dart';
import 'package:my_app/screens/cart/components/discount_code.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 14 * fem, 33.98 * fem),
            width: double.infinity,
            height: 82 * fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 25 * fem, 0 * fem),
                  width: 82 * fem,
                  height: 82 * fem,
                  child: Image.asset(
                    'assets/images/demo_cart_1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 8 * fem, 0 * fem, 2.72 * fem),
                  width: 225 * fem,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 6.52 * fem, 0 * fem),
                        width: double.infinity,
                        height: 43 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 72.09 * fem, 0 * fem),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                    child: Text(
                                      'Logitech MX 2S',
                                      style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 18 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2 * ffem / fem,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    // chutmuen265 (188:1120)
                                    'Chuột màu đen',
                                    style: TextStyle(
                                      fontFamily: 'Solway',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: AppColor.kTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0.98 * fem, 0 * fem, 0 * fem),
                              width: 9 * fem,
                              height: 9 * fem,
                              child: Image.asset(
                                'assets/images/remove_item_cart.png',
                                width: 9 * fem,
                                height: 9 * fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 28.28 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vndp1w (188:1122)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 15 * fem, 0.28 * fem),
                              child: Text(
                                '1.200.000 VND',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: Color(0xffffbd59),
                                ),
                              ),
                            ),
                            Container(
                              // group17842iND (188:1123)
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 0 * fem),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17 * fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MinusItemCart(fem: fem),
                                  SizedBox(
                                    width: 7.72 * fem,
                                  ),
                                  Container(
                                    // yJ9 (188:1133)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 3.72 * fem, 0 * fem, 0 * fem),
                                    child: Text(
                                      '01',
                                      style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7.72 * fem,
                                  ),
                                  Container(
                                    width: 30 * fem,
                                    height: 30 * fem,
                                    // child: Image.asset(
                                    //   'assets/page-1/images/group-17841-A4q.png',
                                    //   width: 28.28 * fem,
                                    //   height: 28.28 * fem,
                                    // ),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty
                                              .resolveWith<CircleBorder?>(
                                                  (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.pressed)) {
                                              return const CircleBorder(
                                                  side: BorderSide(
                                                color: AppColor.primaryDark,
                                              ));
                                            }
                                            return const CircleBorder(
                                                side: BorderSide(
                                              color: AppColor.primaryDark,
                                            ));
                                          }),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color(0xFFE3A344))),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(10 * fem,
                                            0 * fem, 20 * fem, 0 * fem),
                                        child: SvgPicture.asset(
                                          'assets/icons/plus-item-cart-icon.svg',
                                          width: 30 * fem,
                                          height: 30 * fem,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100 * fem,
          ),
          DiscountCode(fem: fem, ffem: ffem),
          Cost(fem: fem, ffem: ffem),
          Container(
            margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 8 * fem, 0 * fem),
            width: double.infinity,
            height: 49 * fem,
            child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
              ButtonReserve(fem: fem, ffem: ffem),
              ButtonPay(fem: fem, ffem: ffem)
            ]),
          )
        ]),
      ),
    );
  }
}



class MinusItemCart extends StatelessWidget {
  const MinusItemCart({
    super.key,
    required this.fem,
  });

  final double fem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30 * fem,
      height: 30 * fem,
      // child: Image.asset(
      //   'assets/page-1/images/group-17841-A4q.png',
      //   width: 28.28 * fem,
      //   height: 28.28 * fem,
      // ),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<CircleBorder?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const CircleBorder(
                    side: BorderSide(
                  color: AppColor.primaryDark,
                ));
              }
              return const CircleBorder(
                  side: BorderSide(
                color: AppColor.primaryDark,
              ));
            }),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 255, 255, 255))),
        child: SvgPicture.asset(
          'assets/icons/minus-item-cart-icon.svg',
          width: 25 * fem,
          height: 25 * fem,
        ),
      ),
    );
  }
}
