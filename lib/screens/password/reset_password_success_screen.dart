import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/widget/decorate_register.dart';

class RestPasswordSuccessScreen extends StatelessWidget {
  const RestPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DecorateRegister(),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/success_stick.png')
                ],
              ),
              
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: const Text(
              'Chức mừng!',
              style: TextStyle(
                color:  AppColor.primary,
                fontFamily: 'Solway',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), 
        const SizedBox(
          height: 5,
        ),

          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: const Text(
              'Đặt lại mật khẩu thành công',
              style: TextStyle(
                color:  Colors.black,
                fontFamily: 'Solway',
                fontSize: 25
              ),
            ),
          ),
        const SizedBox(
          height: 200,
        ),
          //button
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            width: 250,
            height: 60,
            child: ElevatedButton(
              onPressed: () => {

              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black,
                  backgroundColor: AppColor.primary),
              child: const Text(
                'Đăng nhập',
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontFamily: 'Solway'),
                textAlign: TextAlign.center,
              ),
            ),
          )  
            ],
          ),
        ),
      ),
    );
  }
}