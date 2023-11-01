import 'package:flutter/material.dart';
import 'package:my_app/screens/payment/components/body_set_location.dart';

class SetLocationScreem extends StatelessWidget {
  static const String routeName = '/set-location-screen';
  const SetLocationScreem({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SetLocationScreem(
      ),
      settings: const RouteSettings(name: routeName),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child:const Scaffold(
       backgroundColor: Colors.white,
        body: BodySetLocation(),
      ),
    );
  }
}