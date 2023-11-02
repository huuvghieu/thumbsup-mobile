import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cost extends StatelessWidget {
  const Cost({
    super.key,
    required this.fem,
    required this.ffem,
    required this.subTotal,
    required this.deliveryFree,
    required this.tax,
    required this.total,
    required this.quantity,
  });

  final double fem;
  final double ffem;
  final num subTotal;
  final num deliveryFree;
  final num tax;
  final num total;
  final num quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30 * fem, 0 * fem, 30 * fem, 30 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20 * fem),
                child: Text(
                  'Tổng phụ',
                  style: TextStyle(
                    fontFamily: 'Solway',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2 * ffem / fem,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20 * fem),
                child: Text(
                  changeCurrency(subTotal.toDouble()),
                  style: TextStyle(
                    fontFamily: 'Solway',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2 * ffem / fem,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          Divider(
            color: const Color.fromARGB(255, 236, 234, 234),
            thickness: 1 * fem,
          ),
          SizedBox(
            height: 5 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thuế',
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2 * ffem / fem,
                  color: Colors.black,
                ),
              ),
              Text(
                changeCurrency(tax.toDouble()),
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2 * ffem / fem,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Divider(
            color: const Color.fromARGB(255, 236, 234, 234),
            thickness: 1 * fem,
          ),
          SizedBox(
            height: 5 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vận chuyển',
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2 * ffem / fem,
                  color: Colors.black,
                ),
              ),
              Text(
                changeCurrency(deliveryFree.toDouble()),
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2 * ffem / fem,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Divider(
            color: const Color.fromARGB(255, 236, 234, 234),
            thickness: 1 * fem,
          ),
          SizedBox(
            height: 5 * fem,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Tổng tiền',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5 * fem,
                  ),
                  Text(
                    '${quantity} món',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2 * ffem / fem,
                      color: const Color.fromARGB(255, 188, 188, 188),
                    ),
                  ),
                ],
              ),
              Text(
                changeCurrency(total.toDouble()),
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 17 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2 * ffem / fem,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String changeCurrency(double price) {
    return price.isNaN
        ? "0"
        : NumberFormat.currency(locale: 'vi').format(price);
  }
}
    // return Container(
    //   margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 40 * fem),
    //   width: 342 * fem,
    //   height: 169 * fem,
    //   child: Stack(
    //     children: [
    //       Positioned(
    //         left: 0 * fem,
    //         top: 146 * fem,
    //         child: Align(
    //           child: SizedBox(
    //             width: 91 * fem,
    //             height: 23 * fem,
    //             child: Text(
    //               'Tổng tiền',
    //               style: TextStyle(
    //                 fontFamily: 'Solway',
    //                 fontSize: 19 * ffem,
    //                 fontWeight: FontWeight.w400,
    //                 height: 1.2 * ffem / fem,
    //                 color: Colors.black,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         left: 2 * fem,
    //         top: 0 * fem,
    //         child: Container(
    //           width: 340 * fem,
    //           height: 169 * fem,
    //           child: Column(
    //             children: [
    //               Container(
    //                 padding: EdgeInsets.fromLTRB(
    //                     0 * fem, 0 * fem, 0 * fem, 13 * fem),
    //                 width: double.infinity,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 0 * fem, 13 * fem),
    //                       child: Row(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Align(
    //                             // margin: EdgeInsets.fromLTRB(
    //                             //     0 * fem, 2 * fem, 100 * fem, 0 * fem),
    //                             alignment: Alignment.centerLeft,
    //                             child: Text(
    //                               'Tổng phụ',
    //                               style: TextStyle(
    //                                   fontFamily: 'Solway',
    //                                   fontSize: 16 * ffem,
    //                                   fontWeight: FontWeight.w400,
    //                                   height: 1.2 * ffem / fem,
    //                                   color: Colors.black),
    //                             ),
    //                           ),
    //                           Align(
    //                             // margin: EdgeInsets.fromLTRB(
    //                             //     0 * fem, 0 * fem, 2 * fem, 2 * fem),
    //                             alignment: Alignment.centerRight,
    //                             child: Text(
    //                               changeCurrency(subTotal.toDouble() ?? 0),
    //                               textAlign: TextAlign.right,
    //                               style: TextStyle(
    //                                 fontFamily: 'Solway',
    //                                 fontSize: 16 * ffem,
    //                                 fontWeight: FontWeight.w400,
    //                                 height: 1.2 * ffem / fem,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ),
    //                           // Container(
    //                           //   margin: EdgeInsets.fromLTRB(
    //                           //       0 * fem, 1 * fem, 0 * fem, 0 * fem),
    //                           //   child: Text(
    //                           //     'VND',
    //                           //     style: TextStyle(
    //                           //       fontFamily: 'Solway',
    //                           //       fontSize: 14 * ffem,
    //                           //       fontWeight: FontWeight.w400,
    //                           //       height: 1.2 * ffem / fem,
    //                           //       color: AppColor.kTextColor,
    //                           //     ),
    //                           //   ),
    //                           // ),
    //                         ],
    //                       ),
    //                     ),

    //                     //thuế
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 0 * fem, 16 * fem),
    //                       width: 331 * fem,
    //                       height: 1 * fem,
    //                       decoration: BoxDecoration(
    //                         color: Color(0xfff1f1f3),
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 0 * fem, 12 * fem),
    //                       child: Row(
    //                         crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           Container(
    //                             // thuGNM (329:380)
    //                             margin: EdgeInsets.fromLTRB(
    //                                 0 * fem, 1 * fem, 214 * fem, 0 * fem),
    //                             child: Text(
    //                               'Thuế',
    //                               style: TextStyle(
    //                                 fontFamily: 'Solway',
    //                                 fontSize: 16 * ffem,
    //                                 fontWeight: FontWeight.w400,
    //                                 height: 1.2 * ffem / fem,
    //                                 color: Color(0xff000000),
    //                               ),
    //                             ),
    //                           ),
    //                           Container(
    //                             margin: EdgeInsets.fromLTRB(
    //                                 0 * fem, 0 * fem, 4 * fem, 1 * fem),
    //                             child: Text(
    //                              tax.toString(),
    //                               textAlign: TextAlign.right,
    //                               style: TextStyle(
    //                                 fontFamily: 'Solway',
    //                                 fontSize: 16 * ffem,
    //                                 fontWeight: FontWeight.w400,
    //                                 height: 1.2 * ffem / fem,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ),
    //                           Text(
    //                             'VND',
    //                             style: TextStyle(
    //                               fontFamily: 'Solway',
    //                               fontSize: 14 * ffem,
    //                               fontWeight: FontWeight.w400,
    //                               height: 1.2 * ffem / fem,
    //                               color: Color(0xff9796a1),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     //van chuyen
    //                     Container(
    //                       width: 331 * fem,
    //                       height: 1 * fem,
    //                       decoration: const BoxDecoration(
    //                         color: Color(0xfff1f1f3),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 width: double.infinity,
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 151 * fem, 0 * fem),
    //                       child: Text(
    //                         'Vận chuyển',
    //                         style: TextStyle(
    //                           fontFamily: 'Solway',
    //                           fontSize: 16 * ffem,
    //                           fontWeight: FontWeight.w400,
    //                           height: 1.2 * ffem / fem,
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 5 * fem, 3 * fem),
    //                       child: Text(
    //                         deliveryFree.toString(),
    //                         textAlign: TextAlign.right,
    //                         style: TextStyle(
    //                             fontFamily: 'Solway',
    //                             fontSize: 16 * ffem,
    //                             fontWeight: FontWeight.w400,
    //                             height: 1.2 * ffem / fem,
    //                             color: Colors.black),
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 0 * fem, 1 * fem),
    //                       child: Text(
    //                         'VND',
    //                         style: TextStyle(
    //                           fontFamily: 'Solway',
    //                           fontSize: 14 * ffem,
    //                           fontWeight: FontWeight.w400,
    //                           height: 1.2 * ffem / fem,
    //                           color: AppColor.kTextColor,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.fromLTRB(
    //                     95 * fem, 12 * fem, 0 * fem, 0 * fem),
    //                 width: double.infinity,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 9 * fem, 13 * fem),
    //                       width: 331 * fem,
    //                       height: 1 * fem,
    //                       decoration: const BoxDecoration(
    //                         color: Color(0xfff1f1f3),
    //                       ),
    //                     ),
    //                     Container(
    //                       margin: EdgeInsets.fromLTRB(
    //                           0 * fem, 0 * fem, 1 * fem, 0 * fem),
    //                       child: Row(
    //                         crossAxisAlignment: CrossAxisAlignment.end,
    //                         children: [
    //                           Container(
    //                             margin: EdgeInsets.fromLTRB(
    //                                 0 * fem, 0 * fem, 62 * fem, 1 * fem),
    //                             child: Text(
    //                               '(1 món)',
    //                               style: TextStyle(
    //                                 fontFamily: 'Solway',
    //                                 fontSize: 14 * ffem,
    //                                 fontWeight: FontWeight.w400,
    //                                 height: 1.2 * ffem / fem,
    //                                 color: AppColor.kTextColor,
    //                               ),
    //                             ),
    //                           ),
    //                           Text(
    //                             total.toString(),
    //                             textAlign: TextAlign.right,
    //                             style: TextStyle(
    //                               fontFamily: 'Solway',
    //                               fontSize: 19 * ffem,
    //                               fontWeight: FontWeight.w400,
    //                               height: 1.2 * ffem / fem,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                           Text(
    //                             'VND',
    //                             style: TextStyle(
    //                               fontFamily: 'Solway',
    //                               fontSize: 16 * ffem,
    //                               fontWeight: FontWeight.w400,
    //                               height: 1.2 * ffem / fem,
    //                               color: AppColor.kTextColor,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );