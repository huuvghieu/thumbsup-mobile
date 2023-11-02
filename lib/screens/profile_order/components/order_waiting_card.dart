import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/screens/profile_track_order/profile_track_order.dart';

class OrderWaitingCard extends StatelessWidget {
  const OrderWaitingCard({
    super.key,
    required this.fem,
    required this.ffem,
    required this.orderModel,
  });

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

    DateTime converToDatetime(String dateTime) {
      DateTime date = DateTime.parse(dateTime);
      return date.add(Duration(days: 7));
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
                      EdgeInsets.fromLTRB(0 * fem, 21 * fem, 20 * fem, 0 * fem),
                  width: 150 * fem,
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
                      Row(
                        children: [
                          Container(
                            width: 90 * fem,
                            child: Text(
                              '${orderModel.storeName}',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  height: 1.2 * ffem / fem),
                            ),
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
          Container(
            margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 8 * fem),
            width: double.infinity,
            height: 65 * fem,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 65 * fem, 0 * fem),
                  width: 113 * fem,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 2 * fem),
                        child: Text(
                          'Nhận hàng trước',
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: AppColor.kTextColor,
                          ),
                        ),
                      ),
                      Container(
                        width: 150 * fem,
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          '${DateFormat('dd-MM-yyyy').format(converToDatetime(orderModel.dateCreated!))}',
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 1 * fem, 3 * fem),
                        child: Text(
                          'Tình trạng',
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2 * ffem / fem,
                            color: AppColor.kTextColor,
                          ),
                        ),
                      ),
                      Container(
                          // snphmangtrnnggiaofpV (215:1043)
                          constraints: BoxConstraints(
                            maxWidth: 109 * fem,
                          ),
                          child: Text(
                            orderModel.stateCurrent.toString(),
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Solway',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.4 * ffem / fem,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 5 * fem, 0 * fem),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25 * fem))),
                width: 140 * fem,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25 * fem))),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Center(
                    child: Text(
                      'Hủy',
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
              Container(
                margin: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 0 * fem),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25 * fem))),
                width: 140 * fem,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OrderDetailHistory(
                    //         orderDetailList: orderModel.orderDetailList,
                    //         subTotal: orderModel.amount,
                    //         total: orderModel.amount,
                    //       ),
                    //     ))
                    Navigator.push(context,
                      MaterialPageRoute(builder: 
                      (context) => ProfileTrackOrder(orderModel: orderModel,))
                    )
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25 * fem))),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primary)),
                  child: Center(
                    child: Text(
                      'Xem tiến độ',
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
