import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/payment/screens/confirmed_payment_screen.dart';
import 'package:my_app/screens/widget/decorate_top.dart';

class BodyMethodPayment extends StatelessWidget {
  const BodyMethodPayment({super.key});

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
                'Phương thức thanh toán',
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
                children: [
                  SizedBox(
                    height: 10 * fem,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 60 * fem,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 218, 214, 214),
                            borderRadius: BorderRadius.circular(10 * fem),
                            border: Border.all(
                                color: Color.fromARGB(255, 235, 233, 233))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5 * fem),
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/196/196566.png',
                                width: 60 * fem,
                                height: 60 * fem,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30 * fem),
                                child: Text(
                                  'Thanh toán bằng PayPal \n     (Sắp ra mắt)',
                                  style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 14 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConfirmedPaymentScreen() )
                        );
                      },
                      child: Container(
                        height: 60 * fem,
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10 * fem),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 206, 206, 206))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5 * fem),
                              child: Image.asset(
                                'assets/images/logo-zalopay.png',
                                width: 60 * fem,
                                height: 60 * fem,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30 * fem),
                                child: Text(
                                  'Thanh toán bằng ZaloPay',
                                  style: TextStyle(
                                      fontFamily: 'Solway',
                                      fontSize: 14 * ffem,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 60 * fem,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 218, 214, 214),
                            borderRadius: BorderRadius.circular(10 * fem),
                            border: Border.all(
                                color: Color.fromARGB(255, 235, 233, 233))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5 * fem),
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png',
                                width: 60 * fem,
                                height: 60 * fem,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30 * fem),
                                child: Text(
                                  'Thanh toán bằng MoMo \n     (Sắp ra mắt)',
                                  style: TextStyle(
                                    fontFamily: 'Solway',
                                    fontSize: 14 * ffem,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
