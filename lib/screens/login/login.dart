import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/login/register.dart';
import 'package:my_app/screens/password/forget_password_screen.dart';
import 'package:my_app/screens/widget/decorate_register.dart';

import '../../common/color.dart';
import '../../common/image.dart';
import '../widget/text_form_field_custom.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DecorateRegister(),
                  const SizedBox(height: 50.0),
                  const LoginForm(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(
                              builder: (context) => const ForgetPasswordScreen())
                            );
                      },
                      child: const Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                            fontSize: 18.0, color: AppColor.primaryDark),
                      )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  RichText(
                      text: TextSpan(children: <TextSpan>[
                    const TextSpan(
                        text: "Bạn chưa có tài khoản? ",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 18.0)),
                    TextSpan(
                      text: "Đăng ký",
                      style: const TextStyle(
                          color: AppColor.primaryDark,
                          fontSize: 18.0,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register())),
                    )
                  ])),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Row(
                    children: [
                      SizedBox(width: 30.0),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          // indent: 100.0,
                          thickness: 2, // Độ dày của đường thẳng
                          color: Colors.black26, // Màu sắc của đường thẳng
                        ),
                      ),
                      Expanded(
                        flex: 1,
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
                      SizedBox(width: 30.0),
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
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 10.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 45.0,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home(index: 0)),
                        ModalRoute.withName('/'),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryDark,
                        elevation: 5.0,
                        shadowColor: Colors.black,
                        minimumSize: const Size(double.infinity, 20.0),
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
