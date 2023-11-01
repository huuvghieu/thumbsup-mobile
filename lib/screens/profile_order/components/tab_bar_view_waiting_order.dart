import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/repositories/customer_repository.dart';
import 'package:my_app/logic/blocs/customer/customer_bloc.dart';
import 'package:my_app/screens/profile_order/components/order_waiting_card.dart';
import 'package:my_app/screens/profile_order/components/order_waiting_reserved_card.dart';

class TabBarViewWaitingOrder extends StatelessWidget {
  const TabBarViewWaitingOrder({
    super.key,
    required this.fem,
    required this.ffem,
    required this.id,
  });

  final double fem;
  final double ffem;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(
          customerRepository:
              RepositoryProvider.of<CustomerRepository>(context),
          id: id)
        ..add(const LoadOrderByCustomerIdEvent()),
      child: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CustomerLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            );
          }
          if (state is OrderByCustoerIdLoadedState) {
            return Container(
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.orderModelList.length,
                    itemBuilder: (context, index) {
                      final checkOrder = state.orderModelList
                          .where(
                            (order) =>
                                !order.stateCurrent!.contains('Đã hoàn thành'),
                          )
                          .toList();
                      if (checkOrder.isNotEmpty) {
                        return OrderWaitingCard(
                            fem: fem,
                            ffem: ffem,
                            orderModel: checkOrder[index]);
                      } else {
                        return Center(
                          child: Text(
                            'Chưa có đơn hàng',
                            style: TextStyle(
                                fontFamily: 'Solway', fontSize: 25 * fem,
                                color: AppColor.primary
                                ),
                          ),
                        );
                      }
                    },
                  ),
                )
              ]),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
