import 'package:flutter/material.dart';
import 'package:my_app/screens/store/components/body.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

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
        backgroundColor: Colors.white,
        appBar: buildAppBar(fem, ffem),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(double fem, double ffem) {
    
    return AppBar(
      toolbarHeight: 90.0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      leadingWidth: 70.0,
      leading: Builder(builder: (BuildContext context) {
          return Container(
            height: 60,
            margin: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5, color: Colors.black12, spreadRadius: 1)
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                color: Colors.greenAccent,
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        }),
      title: Padding(
        padding: EdgeInsets.fromLTRB(55*fem, 0*fem, 10*fem, 0*fem),
        child: Text(
          'Cửa hàng',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Solway',
            fontSize: 25 * ffem,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
