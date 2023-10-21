import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/profile_reserve_order/profile_reserve_order.dart';

class OrderWaitingReservedCard extends StatelessWidget {
  const OrderWaitingReservedCard({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 60 * fem),
      padding: EdgeInsets.fromLTRB(17 * fem, 17 * fem, 18 * fem, 18 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(18.2 * fem),
          ),
          boxShadow: [
            BoxShadow(
                color: const Color(0x3fd3d1d8),
                offset: Offset(18.2 * fem, 18.2 * fem),
                blurRadius: 18.2 * fem),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 24 * fem),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 15 * fem, 12 * fem, 0 * fem),
                  width: 81 * fem,
                  height: 40 * fem,
                  child: Image.asset(
                    'assets/images/lamvu-store.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 21 * fem, 29 * fem, 0 * fem),
                  width: 96 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 7 * fem),
                        width: double.infinity,
                        child: Text(
                          '2 món',
                          style: TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2 * ffem / fem,
                              color: AppColor.kTextColor),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: Row(
                            children: [
                              Text(
                                'Lâm Music',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    height: 1.2 * ffem / fem),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    2 * fem, 2 * fem, 0 * fem, 0 * fem),
                                width: 8 * fem,
                                height: 8 * fem,
                                child: Image.asset(
                                  'assets/images/tick-blue.png',
                                  width: 8 * fem,
                                  height: 8 * fem,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 43 * fem),
                  child: Text(
                    '#264100',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2 * ffem / fem,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
          padding: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 10*fem),
            child: Text(
              'Hiện tại',
              style: TextStyle(
                fontFamily: 'Solway',
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2 * ffem / fem,
                color: AppColor.kTextColor,
              ),
            ),
          ),
          Padding(
          padding: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 10*fem),
            child: Text(
              'Sản phẩm nhận trực tiếp tại cửa hàng',
              style: TextStyle(
                fontFamily: 'Solway',
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.2 * ffem / fem,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 5 * fem, 0 * fem),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25 * fem))),
                width: 140 * fem,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25 * fem))),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Center(
                    child: Text(
                      'Hủy',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2 * ffem / fem,
                          fontFamily: 'Solway'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 0 * fem),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25 * fem))),
                width: 140 * fem,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProfileReserveOrderDetail(),
                        ))
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25 * fem))),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary)),
                  child: Center(
                    child: Text(
                      'Xem chi tiết',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2 * ffem / fem,
                          fontFamily: 'Solway'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
