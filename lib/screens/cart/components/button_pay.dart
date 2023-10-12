import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

class ButtonPay extends StatelessWidget {
  const ButtonPay({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(33 * fem, 0 * fem, 0 * fem, 0 * fem),
      width: 150 * fem,
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
                      color: AppColor.primary,
                    ));
              }
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.3 * fem),
                  side: const BorderSide(
                    color: Colors.white,
                  ));
            }),
            backgroundColor:
                MaterialStateProperty.all<Color?>(Color(0xFFE3A344))),
        child: Center(
          child: Text(
            'THANH TOÁN',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14 * ffem,
                fontFamily: 'Solway'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}