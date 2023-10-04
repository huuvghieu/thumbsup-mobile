import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/welcome/welcome.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: 350,
      height: 60,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Welcome()),
            ModalRoute.withName('/welcome'),
          )
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            shadowColor: Colors.black,
            backgroundColor: AppColor.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(
                    20, 0, 20, 0 ),
                child: SvgPicture.asset(
                  'assets/icons/logout-icon.svg',
                  width: 30,
                  height: 30 ,
                ),
              ),
            const Padding(
                padding: EdgeInsets.fromLTRB(
                    20, 0, 20, 0 ),
                child: Text(
                  'Đăng xuất',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Solway'),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        )
      ),
    );
  }
}