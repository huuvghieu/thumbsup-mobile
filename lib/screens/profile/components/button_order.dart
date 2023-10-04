import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/profile_order/profile_order_screen.dart';

class ButtonOrder extends StatelessWidget {
  const ButtonOrder({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: double.infinity,
      height: 66 * fem,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => const ProfileOrderScreen(),
            )
          )
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<
                    RoundedRectangleBorder?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10 * fem),
                    side: const BorderSide(
                      color: AppColor.primaryDark,
                    ));
              }
              return RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10 * fem),
                  side: const BorderSide(
                    color: Color(0xffeeeeee),
                  ));
            }),
            backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 255, 255, 255))),

        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    10 * fem, 0 * fem, 20 * fem, 0 * fem),
                child: SvgPicture.asset(
                  'assets/icons/history-order-icon.svg',
                  width: 30 * fem,
                  height: 30 * fem,
                ),
              ),
              Text(
                'Đơn hàng của tôi',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20 * ffem,
                    fontFamily: 'Solway'),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    50 * fem, 0 * fem, 0 * fem, 0 * fem),
                child: SvgPicture.asset(
                  'assets/icons/arrow-next-icon.svg',
                  width: 30 * fem,
                  height: 30 * fem,
                ),
              ),
            ]),
      ),
    );
  }
}