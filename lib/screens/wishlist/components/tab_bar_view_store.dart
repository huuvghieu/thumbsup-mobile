import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

class TabBarViewStore extends StatelessWidget {
  const TabBarViewStore({super.key, required this.fem, required this.ffem});

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 20.29 * fem),
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.2 * fem),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3fd3d1d8),
                              offset: Offset(18.2 * fem, 18.2 * fem),
                              blurRadius: 18.2 * fem,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 12.29 * fem),
                            width: double.infinity,
                            height: 179.71 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 323 * fem,
                                      height: 165.14 * fem,
                                      child: Image.asset(
                                        'assets/images/apple-watch-fav.png',
                                        width: 323 * fem,
                                        height: 165.14 * fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 276.8 * fem,
                                  top: 12.14 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 34 * fem,
                                      height: 34 * fem,
                                      child: Image.asset(
                                        'assets/images/favorite-heart.png',
                                        width: 34 * fem,
                                        height: 34 * fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 13.3 * fem,
                                  top: 12.14 * fem,
                                  child: Container(
                                    width: 94.64 * fem,
                                    height: 34 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(121.4 * fem),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0 * fem,
                                          top: 0 * fem,
                                          child: Align(
                                            child: Container(
                                              width: 81.36 * fem,
                                              height: 34 * fem,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30 * fem),
                                                ),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 2.64 * fem,
                                          top: 9.85 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 79 * fem,
                                              height: 15 * fem,
                                              child: Text(
                                                '500.000VND',
                                                style: TextStyle(
                                                  fontFamily: 'Solway',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w800,
                                                  height: 1.2 * ffem / fem,
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 13.3 * fem,
                                  top: 150.5 * fem,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(8.5 * fem,
                                        8.5 * fem, 4 * fem, 4.64 * fem),
                                    width: 71.64 * fem,
                                    height: 29.14 * fem,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(136 * fem)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x33fe724c),
                                            offset: Offset(0 * fem, 6 * fem),
                                            blurRadius: 12 * fem,
                                          )
                                        ]),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 3 * fem, 0 * fem),
                                            child: Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontFamily: 'Solway',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.2 * ffem / fem,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 2.5 * fem, 0 * fem),
                                            width: 10.27 * fem,
                                            height: 9.8 * fem,
                                            child: Icon(
                                              Icons.star,
                                              size: 13 * fem,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0.93 * fem, 0 * fem, 0 * fem),
                                            child: Text(
                                              '(25+)',
                                              style: TextStyle(
                                                fontFamily: 'Solway',
                                                fontSize: 8.5 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2 * ffem / fem,
                                                color: AppColor.kTextColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 6 * fem),
                                  child: Text(
                                    'Apple Watch',
                                    style: TextStyle(
                                      fontFamily: 'Solway',
                                      fontSize: 18.2 * fem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Apple Watch với LTE modem',
                                  style: TextStyle(
                                      fontFamily: 'Solway',
                                      fontSize: 14.5 * fem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //item 2
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 20.29 * fem),
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.2 * fem),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3fd3d1d8),
                              offset: Offset(18.2 * fem, 18.2 * fem),
                              blurRadius: 18.2 * fem,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 12.29 * fem),
                            width: double.infinity,
                            height: 179.71 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 323 * fem,
                                      height: 165.14 * fem,
                                      child: Image.asset(
                                        'assets/images/apple-watch-fav.png',
                                        width: 323 * fem,
                                        height: 165.14 * fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 276.8 * fem,
                                  top: 12.14 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 34 * fem,
                                      height: 34 * fem,
                                      child: Image.asset(
                                        'assets/images/favorite-heart.png',
                                        width: 34 * fem,
                                        height: 34 * fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 13.3 * fem,
                                  top: 12.14 * fem,
                                  child: Container(
                                    width: 94.64 * fem,
                                    height: 34 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(121.4 * fem),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0 * fem,
                                          top: 0 * fem,
                                          child: Align(
                                            child: Container(
                                              width: 81.36 * fem,
                                              height: 34 * fem,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(30 * fem),
                                                ),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 2.64 * fem,
                                          top: 9.85 * fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 79 * fem,
                                              height: 15 * fem,
                                              child: Text(
                                                '500.000VND',
                                                style: TextStyle(
                                                  fontFamily: 'Solway',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w800,
                                                  height: 1.2 * ffem / fem,
                                                  color: AppColor.primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 13.3 * fem,
                                  top: 150.5 * fem,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(8.5 * fem,
                                        8.5 * fem, 4 * fem, 4.64 * fem),
                                    width: 71.64 * fem,
                                    height: 29.14 * fem,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(136 * fem)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x33fe724c),
                                            offset: Offset(0 * fem, 6 * fem),
                                            blurRadius: 12 * fem,
                                          )
                                        ]),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 3 * fem, 0 * fem),
                                            child: Text(
                                              '4.5',
                                              style: TextStyle(
                                                  fontFamily: 'Solway',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.2 * ffem / fem,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 2.5 * fem, 0 * fem),
                                            width: 10.27 * fem,
                                            height: 9.8 * fem,
                                            child: Icon(
                                              Icons.star,
                                              size: 13 * fem,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0.93 * fem, 0 * fem, 0 * fem),
                                            child: Text(
                                              '(25+)',
                                              style: TextStyle(
                                                fontFamily: 'Solway',
                                                fontSize: 8.5 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2 * ffem / fem,
                                                color: AppColor.kTextColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                13 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 6 * fem),
                                  child: Text(
                                    'Apple Watch',
                                    style: TextStyle(
                                      fontFamily: 'Solway',
                                      fontSize: 18.2 * fem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Apple Watch với LTE modem',
                                  style: TextStyle(
                                      fontFamily: 'Solway',
                                      fontSize: 14.5 * fem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
