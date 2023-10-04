import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

class Cost extends StatelessWidget {
  const Cost({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 63 * fem),
      width: 342 * fem,
      height: 169 * fem,
      child: Stack(
        children: [
          Positioned(
            left: 0 * fem,
            top: 146 * fem,
            child: Align(
              child: SizedBox(
                width: 91 * fem,
                height: 23 * fem,
                child: Text(
                  'Tổng tiền',
                  style: TextStyle(
                    fontFamily: 'Solway',
                    fontSize: 19 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2 * ffem / fem,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 2 * fem,
            top: 0 * fem,
            child: Container(
              width: 340 * fem,
              height: 169 * fem,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 13 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 13 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 2 * fem, 150 * fem, 0 * fem),
                                child: Text(
                                  'Tổng phụ',
                                  style: TextStyle(
                                      fontFamily: 'Solway',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2 * ffem / fem,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 2 * fem, 2 * fem),
                                child: Text(
                                  '1.840.000',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 1 * fem, 0 * fem, 0 * fem),
                                child: Text(
                                  'VND',
                                  style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: AppColor.kTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //thuế
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 16 * fem),
                          width: 331 * fem,
                          height: 1 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f1f3),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 12 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // thuGNM (329:380)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 1 * fem, 214 * fem, 0 * fem),
                                child: Text(
                                  'Thuế',
                                  style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 4 * fem, 1 * fem),
                                child: Text(
                                  '4.000',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Text(
                                'VND',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: Color(0xff9796a1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //van chuyen
                        Container(
                          width: 331 * fem,
                          height: 1 * fem,
                          decoration: const BoxDecoration(
                            color: Color(0xfff1f1f3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 151 * fem, 0 * fem),
                          child: Text(
                            'Vận chuyển',
                            style: TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2 * ffem / fem,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 5 * fem, 3 * fem),
                          child: Text(
                            '20.000',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2 * ffem / fem,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 1 * fem),
                          child: Text(
                            'VND',
                            style: TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2 * ffem / fem,
                              color: AppColor.kTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        95 * fem, 12 * fem, 0 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 9 * fem, 13 * fem),
                          width: 331 * fem,
                          height: 1 * fem,
                          decoration:const BoxDecoration(
                            color: Color(0xfff1f1f3),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 1 * fem, 0 * fem),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 62 * fem, 1 * fem),
                                child: Text(
                                  '(1 món)',
                                  style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2 * ffem / fem,
                                    color: AppColor.kTextColor,
                                  ),
                                ),
                              ),
                              Text(
                                '1.864.000',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 19 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'VND',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: AppColor.kTextColor,
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
          )
        ],
      ),
    );
  }
}