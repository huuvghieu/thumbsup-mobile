import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/widget/decorate_top.dart';

class BodyConfirmedPayment extends StatelessWidget {
  const BodyConfirmedPayment({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const DecorateTop(),
          Padding(
              padding:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 120 * fem),
              child: Text(
                'Xác nhận đơn hàng',
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 25 * ffem,
                  color: Colors.black,
                ),
              )),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(20 * fem, 0 * fem, 20 * fem, 0 * fem),
              width: double.infinity,
              height: 250 * fem,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  border: Border.all(
                      color: const Color.fromARGB(255, 206, 206, 206))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            12 * fem, 11 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Giao đến',
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 16 * ffem,
                            color: AppColor.kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 12 * fem, 0 * fem),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/set-location-screen');
                            },
                            child: Text(
                              'Chỉnh sửa',
                              style: TextStyle(
                                fontFamily: 'Solway',
                                fontSize: 16 * ffem,
                                color: AppColor.primary,
                              ),
                            )),
                      )
                    ],
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
