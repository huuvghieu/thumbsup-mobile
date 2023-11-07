import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/reserve/reserve_screen.dart';

class ButtonReserve extends StatelessWidget {
  const ButtonReserve({
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
          EdgeInsets.fromLTRB(15 * fem, 0 * fem, 0 * fem, 0 * fem),
      width: 130 * fem,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(23.5 * fem),
      ),
      child: TextButton(
        onPressed: () => {
          //  Navigator.push(
          //   context, MaterialPageRoute(
          //     builder: (context) => const ReserveScreen(),
          //   )
          // )
        },
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
                MaterialStateProperty.all<Color?>(AppColor.primary)),
        child: Center(
          child: Text(
            'ĐẶT TRƯỚC',
            style: TextStyle(
                color: Colors.black,
                fontSize: 12 * ffem,
                fontFamily: 'Solway'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}