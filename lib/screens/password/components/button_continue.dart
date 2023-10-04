import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';

class ButtonContinue extends StatelessWidget {
  final String text;

  const ButtonContinue({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.black, backgroundColor: AppColor.primary),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 23, fontFamily: 'Solway'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
