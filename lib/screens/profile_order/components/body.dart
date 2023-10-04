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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 32 * fem),
              padding:
                  EdgeInsets.fromLTRB(6.15 * fem, 4 * fem, 34 * fem, 4 * fem),
              width: double.infinity,
              height: 55 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xfff2eaea)),
                borderRadius: BorderRadius.circular(27.5 * fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 22.89 * fem, 0 * fem),
                    width: 159.96 * fem,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffbd59),
                      borderRadius: BorderRadius.circular(23.5 * fem),
                    ),
                    child: TextButton(
                      onPressed: () => {
                        
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith<
                                RoundedRectangleBorder?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused)) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.3 * fem),
                                side: const BorderSide(
                                  color: AppColor.primaryDark,
                                ));
                          }
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.3 * fem),
                              side: const BorderSide(
                                color: Color(0xffeeeeee),
                              ));
                        }),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColor.primaryDark;
                          }
                          return Color(0xffffffff);
                        }),
                      ),
                      child: Center(
                        child: Text(
                          'Đang chờ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18 * ffem,
                              fontFamily: 'Solway'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: 159.96 * fem,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffbd59),
                      borderRadius: BorderRadius.circular(23.5 * fem),
                    ),
                    child: TextButton(
                      onPressed: () => {
                        
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith<
                                RoundedRectangleBorder?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused)) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.3 * fem),
                                side: const BorderSide(
                                  color: AppColor.primaryDark,
                                ));
                          }
                          return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.3 * fem),
                              side: const BorderSide(
                                color: Color(0xffeeeeee),
                              ));
                        }),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColor.primaryDark;
                          }
                          return Color(0xffffffff);
                        }),
                      ),
                      child: Center(
                        child: Text(
                          'Đã hoàn thành',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18 * ffem,
                              fontFamily: 'Solway'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
