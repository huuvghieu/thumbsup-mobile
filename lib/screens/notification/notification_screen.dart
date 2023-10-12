import 'package:flutter/material.dart';

import 'components/body.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: Body(),  
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 90.0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      leadingWidth: 70.0,
      
      title:const Center(
        child: Text(
          'Thông báo',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Solway',
            fontSize: 25,
            fontWeight: FontWeight.w400,
            ),
        ),
      ),
    );
  }
}
