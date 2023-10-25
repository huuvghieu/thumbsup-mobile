import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/logic/cubits/google_auth/cubit/google_auth_cubit.dart';
import 'package:my_app/model/jwt.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/login/login.dart';
import 'package:my_app/screens/login/register.dart';
import 'package:my_app/services/shared_pref%20_service.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPref sharedPref = SharedPref();
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Chào mừng đến",
                style: TextStyle(
                    fontSize: 43,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "ThumbSup",
                style: TextStyle(
                    fontSize: 43,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                    color: AppColor.primary),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Tìm thiết bị điện tử với giá cả phải chăng",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.lowText,
                      decoration: TextDecoration.none),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Divider(
                        // indent: 100.0,
                        thickness: 2, // Độ dày của đường thẳng
                        color: Colors.black, // Màu sắc của đường thẳng
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Đăng nhập với",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        // indent: 100.0,
                        thickness: 2, // Độ dày của đường thẳng
                        color: Colors.black, // Màu sắc của đường thẳng
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(
                      onPressed: state is GoogleAuthLoadingState
                          ? null
                          : () => {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                          child: CircularProgressIndicator(
                                              color: AppColor.primaryDark));
                                    }),
                                context
                                    .read<GoogleAuthCubit>()
                                    .login()
                                    .then((result) => {
                                          Navigator.of(context).pop(),
                                          if (result is Jwt)
                                            {
                                              sharedPref.save("jwt", result),
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Home(index: 0)),
                                                ModalRoute.withName('/'),
                                              ),
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  duration: const Duration(
                                                      milliseconds: 2000),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Login success!',
                                                    message:
                                                        'Welcome ${result.user.toString()} to Thumbsup!',
                                                    contentType:
                                                        ContentType.success,
                                                  ),
                                                ))
                                            }
                                          else if (result is String)
                                            {
                                              ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(SnackBar(
                                                  elevation: 0,
                                                  duration: const Duration(
                                                      milliseconds: 1000),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  content:
                                                      AwesomeSnackbarContent(
                                                    title: 'Login fail!',
                                                    message: result,
                                                    contentType:
                                                        ContentType.failure,
                                                  ),
                                                ))
                                            }
                                        }),
                              },
                      icon: const Image(
                        image: AssetImage(googleLogo),
                        width: 30,
                        height: 30,
                      ),
                      label: state is GoogleAuthLoadingState
                          ? const CircularProgressIndicator(
                              color: AppColor.primaryDark)
                          : const Text(
                              "Đăng nhập bằng Google",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                      style: ElevatedButton.styleFrom(
                          elevation: 10.0,
                          shadowColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50.0),
                          backgroundColor: AppColor.primary),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login())),
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                    shadowColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50.0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(
                          color: AppColor.primaryDark,
                          width: 2.0,
                        )),
                  ),
                  child: const Text(
                    "Đăng nhập bằng tài khoản",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                const TextSpan(
                    text: "Bạn chưa có tài khoản? ",
                    style: TextStyle(color: Colors.black54, fontSize: 18.0)),
                TextSpan(
                  text: "Đăng kí",
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
              ]))
            ],
          ),
        ),
      ),
    );
    // );
  }
}
