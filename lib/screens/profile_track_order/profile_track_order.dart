import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/string.dart';
import 'package:my_app/data/models/order_model.dart';
import 'package:my_app/logic/blocs/state/state_bloc.dart';
import 'package:my_app/screens/profile_track_order/components/button_order_detail.dart';
import 'package:timelines/timelines.dart';

class ProfileTrackOrder extends StatelessWidget {
  const ProfileTrackOrder({super.key, required this.orderModel});

  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    DateTime converToDatetime(String dateTime) {
      DateTime date = DateTime.parse(dateTime);
      return date;
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20*fem,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20 * fem),
                  child: Text(
                    'Mã đơn hàng : ${orderModel.id}',
                    style: TextStyle(
                      fontFamily: "Solway",
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20 * fem),
                  child: Text(
                    'Hôm nay',
                    style: TextStyle(
                      fontFamily: "Solway",
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50 * fem,
            ),
            BlocBuilder<StateBloc, StateState>(
              builder: (context, state) {
                if (state is StateLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  );
                }
                if (state is StateLoadedState) {
                  bool isCurrent1 = state.stateModels[0].state!
                      .contains('${orderModel.stateDetailList![0].stateName}');
                  return Column(
                    children: [
                      FirstNode(
                        fem: fem,
                        stateString: '${state.stateModels[0].state}',
                        isCurrent: isCurrent1,
                        isDone: isCurrent1,
                        orderModel: orderModel,
                      ),
                      TimelineTile(
                        oppositeContents: Padding(
                          padding: EdgeInsets.all(30 * fem),
                          child: Text('07:45am'),
                        ),
                        contents: Padding(
                          padding: EdgeInsets.all(30 * fem),
                          child: Text('${state.stateModels[1].state}'),
                        ),
                        node: const TimelineNode(
                          indicator: DotIndicator(
                            color: AppColor.primary,
                          ),
                          startConnector: SolidLineConnector(
                            color: AppColor.primary,
                          ),
                          endConnector: SolidLineConnector(
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      TimelineTile(
                        oppositeContents: Padding(
                          padding: EdgeInsets.all(30 * fem),
                          child: Text('08:00am'),
                        ),
                        contents: Padding(
                          padding: EdgeInsets.all(30 * fem),
                          child: Text('Đang trên đường'),
                        ),
                        node: const TimelineNode(
                          indicator: DotIndicator(
                            color: AppColor.primary,
                          ),
                          startConnector: SolidLineConnector(
                            color: AppColor.primary,
                          ),
                          endConnector: SolidLineConnector(
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      TimelineTile(
                        oppositeContents: Padding(
                          padding: EdgeInsets.all(30 * fem),
                          child: Text('08:10am'),
                        ),
                        contents: Padding(
                          padding: EdgeInsets.all(30 * fem),
                          child: Text('Đã giao'),
                        ),
                        node: const TimelineNode(
                          indicator: DotIndicator(
                            color: AppColor.primary,
                          ),
                          startConnector: SolidLineConnector(
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Container();
              },
            ),
            SizedBox(
              height: 80 * fem,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(35 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 300 * fem,
              height: 49 * fem,
              child: ButtonOrderDetail(
                fem: fem,
                ffem: ffem,
                customerId: AppString.customerId,
                orderModel: orderModel,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return AppBar(
      toolbarHeight: 100 * fem,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leadingWidth: 70.0,
      leading: Builder(builder: (BuildContext context) {
        return Container(
          height: 60 * fem,
          margin: EdgeInsets.fromLTRB(20 * fem, 5 * fem, 0 * fem, 5 * fem),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5 * fem,
                  color: Colors.black12,
                  spreadRadius: 1 * fem)
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              color: Colors.greenAccent,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 20 * fem,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      }),
      title: Padding(
        padding: EdgeInsets.only(left: 30 * fem),
        child: Text(
          'Theo dõi đơn hàng',
          style: TextStyle(
              fontFamily: 'Solway',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20 * ffem),
        ),
      ),
    );
  }
}

class FirstNode extends StatelessWidget {
  FirstNode(
      {super.key,
      required this.fem,
      required this.stateString,
      required this.orderModel,
      required this.isDone,
      required this.isCurrent});

  final double fem;
  final OrderModel orderModel;
  final String stateString;
  bool isDone;
  bool isCurrent;
  @override
  Widget build(BuildContext context) {
    DateTime converToDatetime(String dateTime) {
      DateTime date = DateTime.parse(dateTime);
      return date;
    }

    Color getColor(bool isDone) {
      if (isDone) {
        return AppColor.primary;
      }
      return const Color.fromARGB(255, 187, 170, 145);
    }

    double getSize(bool isCurrent) {
      if (isCurrent) {
        return 25 * fem;
      }
      return 18 * fem;
    }

    return TimelineTile(
      oppositeContents: Padding(
        padding: EdgeInsets.all(30 * fem),
        child: Column(
          children: [
            Text(
                '${DateFormat('dd-MM-yyyy').format(converToDatetime(orderModel.dateCreated!))}'),
            Text(
                '${DateFormat('H:m').format(converToDatetime(orderModel.dateCreated!))}'),
          ],
        ),
      ),
      contents: Padding(
        padding: EdgeInsets.all(30 * fem),
        child: Text(stateString),
      ),
      node: TimelineNode(
        indicator: DotIndicator(
          color: AppColor.primary,
          size: getSize(isCurrent),
        ),
        startConnector: null,
        endConnector: SolidLineConnector(color: getColor(isDone)),
      ),
    );
  }
}
