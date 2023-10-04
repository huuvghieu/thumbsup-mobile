import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

class DiscountCode extends StatelessWidget {
  const DiscountCode({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 11 * fem, 28 * fem),
      padding:
          EdgeInsets.fromLTRB(20 * fem, 8 * fem, 10.48 * fem, 7.87 * fem),
      width: 330 * fem,
      height: 60 * fem,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xfff2eaea)),
        borderRadius: BorderRadius.circular(27.5 * fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(
              'Mã khuyến mãi',
              style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 13 * fem,
                  color: AppColor.kTextColor),
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(0 * fem, 0 * fem, 5 * fem, 0 * fem),
            width: 100 * fem,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffbd59),
              borderRadius: BorderRadius.circular(23.5 * fem),
            ),
            child: TextButton(
              onPressed: () => {},
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith<
                    RoundedRectangleBorder?>((Set<MaterialState> states) {
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
                  return AppColor.primaryDark;
                }),
              ),
              child: Center(
                child: Text(
                  'Áp dụng',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13 * ffem,
                      fontFamily: 'Solway'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}