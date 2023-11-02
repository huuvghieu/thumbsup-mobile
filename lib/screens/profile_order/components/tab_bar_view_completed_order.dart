import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/data/repositories/customer_repository.dart';
import 'package:my_app/logic/blocs/customer/customer_bloc.dart';
import 'package:my_app/screens/profile_order/order_detail_screen.dart';

class TabBarViewCompletedOrder extends StatelessWidget {
  const TabBarViewCompletedOrder(
      {super.key, required this.fem, required this.ffem, required this.id});

  final double fem;
  final double ffem;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(
          customerRepository:
              RepositoryProvider.of<CustomerRepository>(context))
        ..add(LoadOrderByCustomerIdEvent(id: id)),
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
            final checkOrder = state.orderModelList
                .where(
                  (order) => order.stateCurrent!.contains('Đã nhận hàng'),
                )
                .toList();
            if (checkOrder.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit_document,
                  size: 50*fem,
                  color: AppColor.primary,),
                  Text(
                    'Chưa có đơn hàng \n  đã hoàn thành',
                    style: TextStyle(
                        fontFamily: 'Solway',
                        fontSize: 25 * fem,
                        color: AppColor.primary),
                  ),
                ],
              );
            }
            return Container(
              child: Column(children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.orderModelList.length,
                    itemBuilder: (context, index) {
                      if (checkOrder.isNotEmpty) {
                        return OrderCompletedCard(
                            fem: fem,
                            ffem: ffem,
                            orderModel: checkOrder[index]);
                      }
                      // else {
                      //   return Center(
                      //     child: Text(
                      //       'Chưa có đơn hàng',
                      //       style: TextStyle(
                      //           fontFamily: 'Solway',
                      //           fontSize: 25 * fem,
                      //           color: AppColor.primary),
                      //     ),
                      //   );
                      // }
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

class OrderCompletedCard extends StatelessWidget {
  const OrderCompletedCard(
      {super.key,
      required this.fem,
      required this.ffem,
      required this.orderModel});

  final double fem;
  final double ffem;
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    int totalQuantity = 0;

    int sumQuantity() {
      int sum = 0;
      orderModel.orderDetailList!.forEach((detail) {
        sum += detail.quantity!;
      });
      return sum;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 60 * fem),
      padding: EdgeInsets.fromLTRB(17 * fem, 17 * fem, 18 * fem, 18 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(18.2 * fem),
          ),
          boxShadow: [
            BoxShadow(
                color: const Color(0x3fd3d1d8),
                offset: Offset(18.2 * fem, 18.2 * fem),
                blurRadius: 18.2 * fem),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 24 * fem),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 15 * fem, 12 * fem, 0 * fem),
                  width: 81 * fem,
                  height: 60 * fem,
                  child: Image.network(
                    '${orderModel.orderDetailList![0].productImage}',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 21 * fem, 29 * fem, 0 * fem),
                  width: 96 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 7 * fem),
                        width: double.infinity,
                        child: Text(
                          '${totalQuantity = sumQuantity()} món',
                          style: TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2 * ffem / fem,
                              color: AppColor.kTextColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 0 * fem),
                        child: Row(
                          children: [
                            Text(
                              '${orderModel.storeName}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  height: 1.2 * ffem / fem),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  2 * fem, 2 * fem, 0 * fem, 0 * fem),
                              width: 8 * fem,
                              height: 8 * fem,
                              child: Image.asset(
                                'assets/images/tick-blue.png',
                                width: 8 * fem,
                                height: 8 * fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 5 * fem, 0 * fem, 0 * fem),
                          child: Row(
                            children: [
                              Text(
                                'Hoàn thành',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2 * ffem / fem,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 43 * fem),
                  child: Text(
                    '#${orderModel.id}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2 * ffem / fem,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 0 * fem),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25 * fem))),
                width: 140 * fem,
                height: 50,
                child: ElevatedButton(
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
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25 * fem))),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary)),
                  child: Center(
                    child: Text(
                      'Xem chi tiết',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2 * ffem / fem,
                          fontFamily: 'Solway'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
