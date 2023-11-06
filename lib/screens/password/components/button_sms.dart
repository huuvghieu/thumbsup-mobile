import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonSMS extends StatelessWidget {
  final String svgPicture;
  final String text;

  const ButtonSMS({
    super.key, required this.svgPicture, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.black,
          backgroundColor: const Color.fromARGB(211, 237, 237, 237),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: SvgPicture.asset(
              svgPicture,
              width: 45,
              height: 45,
            ),
          ),
           Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Solway'
              ),
            textAlign: TextAlign.start,
          ),
        ]),
      ),
    );
  }
}
