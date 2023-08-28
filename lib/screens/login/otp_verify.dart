import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/screens/widget/decorate_register.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../home/home.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify(
      {super.key, required this.verificationId, required this.phoneNumber});

  final String verificationId;

  final String phoneNumber;

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  var code = "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const DecorateRegister(),
                  const SizedBox(height: 40.0),
                  const Image(
                    image: AssetImage(otpVerify),
                    width: 200.0,
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Nhập mã OTP đã được gửi đến số điện thoại ${widget.phoneNumber}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColor.lowText, fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: OTPTextField(
                        controller: otpController,
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 50,
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 15.0,
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: AppColor.primaryDark,
                        ),
                        onChanged: (pin) {
                          code = pin;
                          print("Changed: $pin");
                        },
                        onCompleted: (pin) {
                          print("Completed: $pin");
                        }),
                  ),
                  const SizedBox(height: 30.0),
                  SendAgain(
                      loading: true,
                      verificationId: widget.verificationId,
                      phoneNumber: widget.phoneNumber),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (await verifyOTP(widget.verificationId, code)) {
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home(index: 0)),
                              ModalRoute.withName('/'),
                            );
                          }
                        } else if (context.mounted) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Lỗi!'),
                              content: const Text("Mã OTP không chính xác!"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Close'),
                                  style: TextButton.styleFrom(
                                      foregroundColor: AppColor.primaryDark),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        }
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
                        "Xác minh",
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

  Future<bool> verifyOTP(String verify, String otp) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: otp);

      // Sign the user in (or link) with the credential
      var credentials = await auth.signInWithCredential(credential);
      return credentials.user != null ? true : false;
    } catch (e) {
      print("Wrong OTP!");
      return false;
    }
  }
}

class SendAgain extends StatefulWidget {
  const SendAgain(
      {super.key,
      required this.loading,
      required this.verificationId,
      required this.phoneNumber});

  final bool loading;

  final String verificationId;

  final String phoneNumber;

  @override
  State<SendAgain> createState() => _SendAgainState();
}

class _SendAgainState extends State<SendAgain> {
  late bool _localLoading;

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 60);

  @override
  void initState() {
    super.initState();
    _localLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return RichText(
        text: TextSpan(children: <TextSpan>[
      const TextSpan(
          text: "Tôi không nhận được mã! ",
          style: TextStyle(color: Colors.black54, fontSize: 18.0)),
      _localLoading
          ? TextSpan(
              text: "Gửi lại",
              style: const TextStyle(
                  color: AppColor.primaryDark,
                  fontSize: 18.0,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: widget.phoneNumber,
                  //   timeout: const Duration(seconds: 120),
                  //   verificationCompleted: (PhoneAuthCredential credential) {
                  //     FirebaseAuth.instance.signInWithCredential(credential);
                  //   },
                  //   verificationFailed: (FirebaseAuthException e) {
                  //     String error;
                  //     if (e.code == 'invalid-phone-number') {
                  //       print('The provided phone number is not valid.');
                  //       error = "Số điện thoại không hợp lệ!";
                  //     } else {
                  //       error = "Hạn ngạch SMS đã bị vượt quá!";
                  //     }
                  //     showDialog<String>(
                  //       context: context,
                  //       builder: (BuildContext context) => AlertDialog(
                  //         title: const Text('Lỗi!'),
                  //         content: Text(error),
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(20.0)),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             onPressed: () => Navigator.pop(context, 'Close'),
                  //             style: TextButton.styleFrom(
                  //                 foregroundColor: AppColor.primaryDark),
                  //             child: const Text('Close'),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  //   codeSent: (String verificationId, int? resendToken) {},
                  //   codeAutoRetrievalTimeout: (String verificationId) {
                  //     showDialog<String>(
                  //       context: context,
                  //       builder: (BuildContext context) => AlertDialog(
                  //         title: const Text('Lỗi!'),
                  //         content: const Text('Mã OTP đã quá hạn!'),
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(20.0)),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             onPressed: () => Navigator.pop(context, 'Close'),
                  //             style: TextButton.styleFrom(
                  //                 foregroundColor: AppColor.primaryDark),
                  //             child: const Text('Close'),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // );
                  startTimer();
                  setState(() {
                    _localLoading = false;
                  });
                },
            )
          : TextSpan(
              text: '$seconds giây',
              style: const TextStyle(
                  color: AppColor.primaryDark,
                  fontSize: 18.0,
                  decoration: TextDecoration.underline),
            )
    ]));
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(seconds: 60));
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        setState(() {
          _localLoading = true;
          myDuration = const Duration(seconds: 60);
        });
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
}
