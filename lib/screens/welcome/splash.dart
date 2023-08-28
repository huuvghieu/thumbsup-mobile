import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/welcome/get_start.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColor.primary,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: AnimatedOpacity(
                opacity: animate ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 2000),
                child: const Image(
                  image: AssetImage(splash2Image),
                ),
              )),
          Expanded(
              flex: 2,
              child: AnimatedOpacity(
                opacity: animate ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 2000),
                child: const Image(image: AssetImage(splash1Image)),
              )),
          Expanded(
              flex: 1,
              child: AnimatedOpacity(
                opacity: animate ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 2000),
                child: const Image(image: AssetImage(splash3Image)),
              ))
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Scaffold(body: GetStart()),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
    }
  }
}
