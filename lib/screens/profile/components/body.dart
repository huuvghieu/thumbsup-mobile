import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/profile/components/button_history_transaction.dart';
import 'package:my_app/screens/profile/components/button_logout.dart';
import 'package:my_app/screens/profile/components/button_order.dart';
import 'package:my_app/screens/profile/components/button_wallet.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        child: Container(
          padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1 * fem),
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.fromLTRB(11 * fem, 37 * fem, 17 * fem, 137 * fem),
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 2 * fem),
                      width: 341 * fem,
                      height: 157 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 64 * fem,
                            top: 15 * fem,
                            child: Container(
                              width: 277 * fem,
                              height: 139 * fem,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(39.5 * fem,
                                        0 * fem, 39.5 * fem, 27 * fem),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 69.5 * fem, 4 * fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    7.5 * fem,
                                                    0 * fem),
                                                child: Text(
                                                  'Trần Ngọc',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontFamily: 'Solway',
                                                      fontSize: 20 * ffem,
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.2 * ffem / fem,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 18 * fem,
                                                height: 19 * fem,
                                                child: SvgPicture.asset(
                                                    'assets/icons/pencil-icon.svg'),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 40 * fem, 0 * fem),
                                            width: double.infinity,
                                            child: Text(
                                              'tranngoc@gmail.com',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Solway',
                                                fontSize: 14 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2 * ffem / fem,
                                                color: AppColor.kTextColor,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 21 * fem),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 108 * fem, 0 * fem),
                                          child: Text(
                                            'Bạc',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Solway',
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2 * ffem / fem,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 19 * fem, 4 * fem),
                                          width: 27 * fem,
                                          height: 24 * fem,
                                          child: SvgPicture.asset(
                                              'assets/icons/wallet-icon.svg'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 0 * fem, 1 * fem),
                                          child: Text(
                                            '100.000VND',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Solway',
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2 * ffem / fem,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        180 * fem, 0 * fem, 0 * fem, 1 * fem),
                                    width: double.infinity,
                                    child: Text(
                                      '100.000VND',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2 * ffem / fem,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 94 * fem,
                                height: 74 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(54 * fem),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 19 * fem,
                            top: 9 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 54 * fem,
                                height: 55 * fem,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100 * fem),
                                  child: SvgPicture.asset(
                                      'assets/icons/avatar-girl-icon.svg'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 26 * fem,
                            top: 87 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 28 * fem,
                                height: 27 * fem,
                                child: SvgPicture.asset(
                                    'assets/icons/ranking-rank-silver-icon.svg'),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 200 * fem,
                            top: 127 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 30 * fem,
                                height: 30 * fem,
                                child: SvgPicture.asset(
                                    'assets/icons/cash-coins-icon.svg'),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 26 * fem,
                            top: 130 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 105 * fem,
                                height: 25 * fem,
                                child: Image.asset(
                                  'assets/images/profile_percent.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17 * fem,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          4 * fem, 0 * fem, 0 * fem, 59 * fem),
                      child: Column(
                        children: [
                          ButtonWallet(fem: fem, ffem: ffem),
                          ButtonOrder(fem: fem, ffem: ffem),
                          ButtonHistoryTransaction(fem: fem, ffem: ffem),
                          SizedBox(
                            height: 50*fem,
                          ),
                          ButtonLogout(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

