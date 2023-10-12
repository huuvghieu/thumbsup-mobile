import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

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
        child: Container(
          width: double.infinity,
          height: 812 * fem,
          child: Column(
            children: [
              SizedBox(
                height: 80 * fem,
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 20 * fem, 19 * fem, 20 * fem),
                  width: 347 * fem,
                  height: 90 * fem,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: Color.fromARGB(255, 187, 183, 183)),
                    borderRadius: BorderRadius.circular(10 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x115a6cea),
                        offset: Offset(0 * fem, 10 * fem),
                        blurRadius: 25 * fem,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50 * fem,
                        width: 58 * fem,
                        child: Image.asset('assets/images/new_news.png'),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(
                                20 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'Tin tức mới',
                                    style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    '6.00 AM',
                                    style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.kTextColor),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40 * fem,
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 20 * fem, 19 * fem, 20 * fem),
                  width: 347 * fem,
                  height: 90 * fem,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 187, 183, 183)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x115a6cea),
                        offset: Offset(0 * fem, 10 * fem),
                        blurRadius: 25 * fem,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50 * fem,
                        width: 58 * fem,
                        child: Image.asset('assets/images/cash_coin.png'),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(
                                20 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'Nạp thêm 100.000VND thành công',
                                    style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    '8.00 AM',
                                    style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.kTextColor),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40 * fem,
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 20 * fem, 19 * fem, 20 * fem),
                  width: 347 * fem,
                  height: 90 * fem,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 187, 183, 183)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x115a6cea),
                        offset: Offset(0 * fem, 10 * fem),
                        blurRadius: 25 * fem,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50 * fem,
                        width: 58 * fem,
                        child: Image.asset('assets/images/cancel-icon.png'),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(
                                20 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'Đon hàng của bạn đã bị hủy',
                                    style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    '22 July 2021',
                                    style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.kTextColor),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40 * fem,
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 20 * fem, 19 * fem, 20 * fem),
                  width: 347 * fem,
                  height: 90 * fem,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 187, 183, 183)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x115a6cea),
                        offset: Offset(0 * fem, 10 * fem),
                        blurRadius: 25 * fem,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50 * fem,
                        width: 58 * fem,
                        child: Image.asset('assets/images/success-icon.png'),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(
                                20 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'Đơn đặt hàng của bạn đã \nđược giao thành công',
                                    style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
