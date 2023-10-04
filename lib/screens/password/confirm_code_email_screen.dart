import 'package:flutter/material.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/screens/password/reset_password_success_screen.dart';
import 'package:my_app/screens/widget/decorate_register.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class ConfirmCodeEmailScreen extends StatelessWidget {
  const ConfirmCodeEmailScreen({super.key});

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
                          margin: const EdgeInsets.fromLTRB(0, 0, 120, 0),
                          child: const Text(
                            'Mã xác nhận',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Solway', fontSize: 37),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: const Text(
                            'Vui lòng nhập mã xác minh được gửi tới \n',
                            style: TextStyle(
                                color: AppColor.kTextColor,
                                fontFamily: 'Solway',
                                fontSize: 15),
                          ),
                        ),
        
                        OtpForm(),

                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                              child: const Text(
                                'Tôi không nhận được mã!',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 20,
                                  color: AppColor.kTextColor
                                  
                                ),
                              ),
                            ),
                              Container(
                              child: const Text(
                                'Gửi lại',
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 20,
                                  color: AppColor.primary
                                ),
                              ),
                            ),
                            ]
                          ),
                        ),
                        
                        const SizedBox(
                          height: 20,
                        ),
                        
                        //button
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () => {
                              // if (_formKey.currentState!.validate())
                              //   {
                              //     _formKey.currentState!.save(),
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 const ConfirmCodeEmailScreen()))
                              //   }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RestPasswordSuccessScreen(),
                                  ))
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28)),
                                shadowColor: Colors.black,
                                backgroundColor: AppColor.primary),
                            child: const Text(
                              'Xác nhận',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Solway'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: OTPTextField(
        length: 4,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 50,
        style: const TextStyle(
          fontSize: 30.0,
          color: AppColor.primaryDark,
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.box,
      ),
    );
  }
}
