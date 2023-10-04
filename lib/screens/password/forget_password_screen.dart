import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/password/components/button_continue.dart';
import 'package:my_app/screens/password/components/button_email.dart';
import 'package:my_app/screens/widget/decorate_register.dart';

import 'components/button_sms.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DecorateRegister(),
              Center(
                child: Container(
                  height: 500,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(37, 35, 38, 0),
                  padding: const EdgeInsets.fromLTRB(21, 30, 21, 50),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0X3F000000),
                        offset: Offset(0, 0),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Quên mật khẩu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: const Text(
                          'Chọn cách liên hệ bạn muốn sử \ndụng để thiết lập lại mật khẩu',
                          style: TextStyle(
                              color: AppColor.kTextColor,
                              fontFamily: 'Solway',
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const ButtonSMS(
                        svgPicture: messageIcon,
                        text: 'Qua SMS',
                      ),
      
                      const ButtonEmail(
                        svgPicture: mailIcon,
                         text: 'Qua Email'),
      
                      const ButtonContinue(
                        text: 'Tiếp tục',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}


