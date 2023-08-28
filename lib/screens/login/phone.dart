import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/login/otp_verify.dart';
import 'package:my_app/screens/widget/decorate_register.dart';

class PhoneVerify extends StatefulWidget {
  const PhoneVerify({super.key});

  @override
  State<PhoneVerify> createState() => _PhoneVerifyState();
}

class _PhoneVerifyState extends State<PhoneVerify> {
  PhoneNumber phoneNumber = PhoneNumber();
  final controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PhoneNumber number = PhoneNumber(isoCode: 'VN');

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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DecorateRegister(),
                  const Image(
                    image: AssetImage(phoneVerify),
                    width: 220.0,
                  ),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Nhập số điện thoại của bạn để xác minh tài khoản",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColor.lowText, fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: AppColor.primaryDark, width: 2.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            phoneNumber = number;
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: true,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // if (formKey.currentState!.validate()) {
                        //   formKey.currentState?.save();
                        //   await FirebaseAuth.instance.verifyPhoneNumber(
                        //     phoneNumber: phoneNumber.phoneNumber,
                        //     timeout: const Duration(seconds: 120),
                        //     verificationCompleted:
                        //         (PhoneAuthCredential credential) {
                        //       FirebaseAuth.instance
                        //           .signInWithCredential(credential);
                        //     },
                        //     verificationFailed: (FirebaseAuthException e) {
                        //       String error;
                        //       if (e.code == 'invalid-phone-number') {
                        //         print('The provided phone number is not valid.');
                        //         error = "Số điện thoại không hợp lệ!";
                        //       } else {
                        //         error = "Hạn ngạch SMS đã bị vượt quá!";
                        //       }
                        //       showDialog<String>(
                        //         context: context,
                        //         builder: (BuildContext context) => AlertDialog(
                        //           title: const Text('Lỗi!'),
                        //           content: Text(error),
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20.0)),
                        //           actions: <Widget>[
                        //             TextButton(
                        //               onPressed: () =>
                        //                   Navigator.pop(context, 'Close'),
                        //               style: TextButton.styleFrom(
                        //                   foregroundColor: AppColor.primaryDark),
                        //               child: const Text('Close'),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //     codeSent: (String verificationId, int? resendToken) {
                        //       Navigator.push(
                        //           context,
                        //           MaterialPageRoute(
                        //               builder: (context) => OtpVerify(
                        //                     verificationId: verificationId,
                        //                     phoneNumber: phoneNumber.phoneNumber
                        //                         .toString(),
                        //                   )));
                        //     },
                        //     codeAutoRetrievalTimeout: (String verificationId) {
                        //       showDialog<String>(
                        //         context: context,
                        //         builder: (BuildContext context) => AlertDialog(
                        //           title: const Text('Lỗi!'),
                        //           content: const Text(
                        //               'Mã OTP đã quá hạn!'),
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(20.0)),
                        //           actions: <Widget>[
                        //             TextButton(
                        //               onPressed: () =>
                        //                   Navigator.pop(context, 'Close'),
                        //               style: TextButton.styleFrom(
                        //                   foregroundColor: AppColor.primaryDark),
                        //               child: const Text('Close'),
                        //             ),
                        //           ],
                        //         ),
                        //       );
                        //     },
                        //   );
                        // } else {
                        //   showDialog<String>(
                        //     context: context,
                        //     builder: (BuildContext context) => AlertDialog(
                        //       title: const Text('Lỗi!'),
                        //       content: const Text('Số điện thoại không hợp lệ!'),
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(20.0)),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           onPressed: () =>
                        //               Navigator.pop(context, 'Close'),
                        //           style: TextButton.styleFrom(
                        //               foregroundColor: AppColor.primaryDark),
                        //           child: const Text('Close'),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpVerify(
                                      verificationId: "verificationId",
                                      phoneNumber:
                                          phoneNumber.phoneNumber.toString(),
                                    )));
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
                        "Lấy mã OTP",
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'VN');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
