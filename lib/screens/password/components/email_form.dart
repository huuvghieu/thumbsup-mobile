import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/string.dart';
import 'package:my_app/screens/password/confirm_code_email_screen.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      width: 330,
      child: Form(
        key: _formKey,
        child: Column(children: [
          buildEmailFormField(),
          const SizedBox(
            height: 20,
          ),
          FormError(
            errors: errors,
          ),

          //button
          Container(
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            width: 250,
            height: 60,
            child: ElevatedButton(
              onPressed: () => {
                if (_formKey.currentState!.validate())
                  {
                    _formKey.currentState!.save(),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ConfirmCodeEmailScreen()))
                  }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                  shadowColor: Colors.black,
                  backgroundColor: AppColor.primary),
              child: const Text(
                'Gửi mã xác nhận',
                style: TextStyle(
                    color: Colors.black, fontSize: 20, fontFamily: 'Solway'),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(AppString.kEmailNullError)) {
          setState(() {
            errors.remove(AppString.kEmailNullError);
          });
        } else if (AppString.emailValidationRegExp.hasMatch(value) &&
            errors.contains(AppString.kInvalidEmailError)) {
          setState(() {
            errors.remove(AppString.kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(AppString.kEmailNullError)) {
          setState(() {
            errors.add(AppString.kEmailNullError);
          });
          return '';
        } else if (!AppString.emailValidationRegExp.hasMatch(value) &&
            !errors.contains(AppString.kInvalidEmailError)) {
          setState(() {
            errors.add(AppString.kInvalidEmailError);
          });
          return '';
        }
        return null;
      },
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontFamily: 'Solway'),
      decoration: InputDecoration(
        hintText: 'Nhập email của bạn',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 254, 205, 132), width: 2),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 254, 205, 132), width: 2),
            gapPadding: 10),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 254, 205, 132), width: 2),
            gapPadding: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 254, 205, 132), width: 2),
            gapPadding: 10),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  final List<String> errors;

  const FormError({Key? key, required this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        children: List.generate(
            errors.length, (index) => formErrorText(error: errors[index])),
      ),
    );
  }

  Row formErrorText({String? error}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/error-icon.svg',
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          error!,
          style: const TextStyle(
              color: AppColor.primaryColor, fontFamily: 'Solway', fontSize: 15),
        )
      ],
    );
  }
}
