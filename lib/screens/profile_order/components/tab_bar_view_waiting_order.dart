import 'package:flutter/material.dart';
import 'package:my_app/screens/profile_order/components/order_waiting_card.dart';
import 'package:my_app/screens/profile_order/components/order_waiting_reserved_card.dart';

class TabBarViewWaitingOrder extends StatelessWidget {
  const TabBarViewWaitingOrder({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
          child: ListView(
            children: [
              OrderWaitingCard(fem: fem, ffem: ffem),
              OrderWaitingReservedCard(fem: fem, ffem: ffem),
            ],
          ),
        )
      ]),
    );
  }
}




