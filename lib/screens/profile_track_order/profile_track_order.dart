import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/profile_track_order/components/button_order_detail.dart';
import 'package:timelines/timelines.dart';

class ProfileTrackOrder extends StatelessWidget {
  const ProfileTrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20 * fem),
                  child: Text(
                    'Mã đơn hàng : 4544882266',
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
            TimelineTile(
              oppositeContents: Padding(
                padding: EdgeInsets.all(30 * fem),
                child: Text('07:30am'),
              ),
              contents: Padding(
                padding: EdgeInsets.all(30 * fem),
                child: Text('Xác nhận'),
              ),
              node:const TimelineNode(
                indicator: DotIndicator(
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
                child: Text('07:45am'),
              ),
              contents: Padding(
                padding: EdgeInsets.all(30 * fem),
                child: Text('Chuẩn bị đơn hàng'),
              ),
              node:const TimelineNode(
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
              node:const TimelineNode(
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
            SizedBox(
              height: 80*fem,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(35*fem, 0*fem, 0*fem, 0*fem),
              width: 300 * fem,
              height: 49 * fem,
              child: ButtonOrderDetail(
                fem: fem,
                ffem: ffem,
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
      title: Center(
        child: Text(
          'Theo dõi đơn hàng',
          style: TextStyle(
            fontFamily: 'Solway',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20*ffem
          ),
        ),
      ),
    );
  }
}
