import 'package:flutter/material.dart';

import '../../common/image.dart';

class DecorateRegister extends StatelessWidget {
  const DecorateRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Image(
            image: AssetImage(register2Image),
            width: 50,
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Image(
            image: AssetImage(register1Image),
            width: 150,
          ),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Image(
            image: AssetImage(register3Image),
            width: 70,
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          width: 50,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
                elevation: 10.0,
                shadowColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
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
