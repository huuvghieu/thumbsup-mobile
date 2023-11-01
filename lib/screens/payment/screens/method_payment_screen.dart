import 'package:flutter/material.dart';
import 'package:my_app/screens/payment/components/body_method_payment.dart';

class MethodPaymentScreen extends StatelessWidget {
  static const String routeName = '/method-payment-screen';
  const MethodPaymentScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const MethodPaymentScreen(
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
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const BodyMethodPayment(),
      ),
    );
  }
}