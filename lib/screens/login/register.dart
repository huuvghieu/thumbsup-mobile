import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/login/login.dart';
import 'package:my_app/screens/login/phone.dart';
import 'package:my_app/screens/widget/decorate_register.dart';
import 'package:my_app/screens/widget/text_form_field_custom.dart';

import '../../common/image.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
                  const RegisterForm(),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    const TextSpan(
                        text: "Bạn đã có tài khoản? ",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 18.0)),
                    TextSpan(
                      text: "Đăng nhập",
                      style: const TextStyle(
                          color: AppColor.primaryDark,
                          fontSize: 18.0,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login())),
                    )
                  ])),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Row(
                    children: [
                      SizedBox(width: 20.0),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          // indent: 100.0,
                          thickness: 2, // Độ dày của đường thẳng
                          color: Colors.black26, // Màu sắc của đường thẳng
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            "Đăng nhập với",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          // indent: 100.0,
                          thickness: 2, // Độ dày của đường thẳng
                          color: Colors.black26, // Màu sắc của đường thẳng
                        ),
                      ),
                      SizedBox(width: 25.0),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(googleLogo),
                      width: 30,
                      height: 30,
                    ),
                    label: const Text("GOOGLE"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryDark,
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        elevation: 10.0,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                  ),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    userController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Đăng ký",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormFieldCustom(
                        label: "Họ và tên",
                        hint: "Nhập họ và tên...",
                        icon: Icons.account_box,
                        isPassword: false,
                        controller: nameController),
                    const SizedBox(height: 25.0),
                    TextFormFieldCustom(
                        label: "Tài khoản",
                        hint: "Nhập tài khoản...",
                        icon: Icons.account_circle_rounded,
                        isPassword: false,
                        controller: userController),
                    const SizedBox(height: 25.0),
                    TextFormFieldCustom(
                        label: "Mật khẩu",
                        hint: "Nhập mật khẩu...",
                        icon: Icons.password,
                        isPassword: true,
                        controller: passwordController),
                    const SizedBox(height: 25.0),
                    TextFormFieldCustom(
                        label: "Nhập lại mật khẩu",
                        hint: "Nhập lại mật khẩu...",
                        icon: Icons.password_sharp,
                        isPassword: true,
                        controller: rePasswordController),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PhoneVerify())),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryDark,
                    elevation: 5.0,
                    shadowColor: Colors.black,
                    minimumSize: const Size(double.infinity, 20.0),
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0))),
                child: const Text(
                  "Đăng ký",
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
