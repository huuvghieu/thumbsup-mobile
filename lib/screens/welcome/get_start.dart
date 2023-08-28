import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/welcome/welcome.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      color: AppColor.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Image(
              image: AssetImage(logoImage),
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Welcome()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColor.primaryDark,
                padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                elevation: 5.0,
                shadowColor: Colors.black,
                side: const BorderSide(width: 1.0, color: Colors.white)),
            child: const Text(
              "Bắt đầu khám phá",
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          const SizedBox(
            height: 150.0,
          ),
        ],
      ),
    );
  }
}
