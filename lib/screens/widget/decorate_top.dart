import 'package:flutter/material.dart';

import '../../common/image.dart';

class DecorateTop extends StatelessWidget {
  const DecorateTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Image(
            image: AssetImage(register2Image),
            width: 70,
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Image(
            image: AssetImage(register1Image),
            width: 170,
          ),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Image(
            image: AssetImage(register3Image),
            width: 90,
          ),
        ),
        Positioned(
          top: 55,
          left: 20,
          width: 48,
          height: 48,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
                elevation: 10.0,
                shadowColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                )),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
