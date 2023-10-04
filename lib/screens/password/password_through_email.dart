import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/password/components/email_form.dart';
import 'package:my_app/screens/widget/decorate_register.dart';

class PasswordThroughEmailScreen extends StatelessWidget {
  const PasswordThroughEmailScreen({super.key});

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
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                        child: const Text(
                          'Đặt lại mật khẩu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 37,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                        child: const Text(
                          'Vui lòng nhập địa chỉ email của bạn để \nyêu cầu đặt lại mật khẩu',
                          style: TextStyle(
                              color: AppColor.kTextColor,
                              fontFamily: 'Solway',
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
                const EmailForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

