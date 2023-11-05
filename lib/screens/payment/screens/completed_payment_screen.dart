import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/data/repositories/review_repository.dart';
import 'package:my_app/logic/blocs/review/review_bloc.dart';
import 'package:my_app/screens/payment/components/body_completed_payment.dart';

class CompletedPaymentScreen extends StatelessWidget {
  const CompletedPaymentScreen({super.key});

  // static Route route() {
  //   return MaterialPageRoute(
  //     builder: (_) => const ConfirmedPaymentScreen(),
  //     settings: const RouteSettings(name: routeName),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => ReviewBloc(
              repository: RepositoryProvider.of<ReviewRepository>(context))
            ..add(const LoadReviewEvent()),
          child: const BodyCompletedPayment(),
        ),
      ),
    );
  }
}
