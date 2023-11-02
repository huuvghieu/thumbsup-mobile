import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/screens/profile_order/order_detail_screen.dart';
import 'package:my_app/screens/profile_order/profile_order_screen.dart';

class ButtonOrderDetail extends StatelessWidget {
  const ButtonOrderDetail({
    super.key,
    required this.fem,
    required this.ffem,
    required this.customerId,
    required this.orderModel,
  });

  final double fem;
  final double ffem;
  final int? customerId;
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(5 * fem),
      ),
      child: TextButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetailHistory(
                  orderDetailList: orderModel.orderDetailList,
                  subTotal: orderModel.amount,
                  total: orderModel.amount,
                ),
              ))
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5 * fem),
                    side: const BorderSide(
                      color: AppColor.primary,
                    ));
              }
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5 * fem),
                  side: const BorderSide(
                    color: Colors.white,
                  ));
            }),
            backgroundColor:
                MaterialStateProperty.all<Color?>(AppColor.primary)),
        child: Center(
          child: Text(
            'Xem chi tiết',
            style: TextStyle(
                color: Colors.black, fontSize: 14 * ffem, fontFamily: 'Solway'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
