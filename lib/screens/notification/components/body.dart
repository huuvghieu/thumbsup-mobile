import 'package:flutter/material.dart';

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
          child: Stack(
            children: [
              Positioned(
                left: 14 * fem,
                top: 155 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 20 * fem, 19 * fem, 20 * fem),
                  width: 347 * fem,
                  height: 105 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(22 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x115a6cea),
                        offset: Offset(0 * fem, 0 * fem),
                        blurRadius: 25 * fem,
                      ),
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
