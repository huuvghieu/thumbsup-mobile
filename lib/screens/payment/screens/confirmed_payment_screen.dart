import 'package:flutter/material.dart';
import 'package:my_app/screens/payment/components/body_confirmed_payment.dart';

class ConfirmedPaymentScreen extends StatelessWidget {
  static const String routeName = '/confirmed-payment-screen';
  const ConfirmedPaymentScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ConfirmedPaymentScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        body:  BodyConfirmedPayment(),
      ),
    );
  }
}
