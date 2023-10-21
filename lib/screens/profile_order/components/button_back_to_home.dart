import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/home/home.dart';

class ButtonBackToHome extends StatelessWidget {
  const ButtonBackToHome({
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
          EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(5 * fem),
      ),
      child: TextButton(
        onPressed: () => {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => const Home(index: 0,),
            )
          )
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<
                RoundedRectangleBorder?>((Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5 * fem),
                    side: const BorderSide(
                      color: AppColor.primary,
                    ));
              }
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5 * fem),
                  side: const BorderSide(
                    color: Colors.white,
                  ));
            }),
            backgroundColor:
                MaterialStateProperty.all<Color?>(AppColor.primary)),
        child: Center(
          child: Text(
            'Về trang chủ',
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