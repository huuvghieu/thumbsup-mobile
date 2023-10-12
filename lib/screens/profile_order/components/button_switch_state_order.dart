import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/common/color.dart';

class ButtonSwitchStateOrder extends StatefulWidget {
  const ButtonSwitchStateOrder({super.key});

  @override
  State<ButtonSwitchStateOrder> createState() => _ButtonSwitchStateOrderState();
}

const double deliveryAlign = -1;
const double completedAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = AppColor.primary;

class _ButtonSwitchStateOrderState extends State<ButtonSwitchStateOrder> {
  double? xAlign;
  Color? deliveryTextColor;
  Color? completedTextColor;

  @override
  void initState() {
    super.initState();
    xAlign = deliveryAlign;
    deliveryTextColor = selectedColor;
    completedTextColor = normalColor;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
        width: 330 * fem,
        height: 65 * fem, 
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xfff2eaea)),
          borderRadius: BorderRadius.all(
            Radius.circular(50 * fem),
          ),
        ),
      child: Container(
        padding: EdgeInsets.all(5*fem),
        width: 300 * fem,
        height: 65 * fem,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xfff2eaea)),
          borderRadius: BorderRadius.all(
            Radius.circular(50 * fem),
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign!, 0),
              duration:const Duration(milliseconds: 200),
              child: Container(
                width: 160 * fem,
                height: 65 * fem,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50 * fem),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = deliveryAlign;
                  deliveryTextColor = selectedColor;
                  completedTextColor = normalColor;
                  },
                );
              },
              child: Align(
                alignment:const Alignment(-1,0),
                child: Container(
                  width: 150 * fem,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Đang chờ',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 17*ffem,
                      fontWeight: FontWeight.bold,
                      color: deliveryTextColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            ),
    
            GestureDetector(
              onTap: () {
                setState(() {
                  xAlign = completedAlign;
                  completedTextColor = selectedColor;
                  deliveryTextColor = normalColor;
                  },
                );
              },
              child: Align(
                alignment:const Alignment(1,0),
                child: Container(
                  width: 150 * fem,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Đã hoàn thành',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 17*ffem,
                      fontWeight: FontWeight.bold,
                      color: completedTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
