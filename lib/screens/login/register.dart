import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/repositories/city_repository.dart';
import 'package:my_app/data/repositories/customer_repository.dart';
import 'package:my_app/logic/blocs/customer/customer_bloc.dart';
import 'package:my_app/screens/login/components/dropdrown_form.dart';
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
                  RepositoryProvider(
                    create: (context) => CustomerRepository(),
                    child: RegisterForm(),
                  ),
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
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final List<int> selectedFile = List.empty();
  Uint8List? bytesData;
  String? filename;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    userController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(
          customerRepository:
              RepositoryProvider.of<CustomerRepository>(context))
        ..add(RegisterEvent(
            userName: userController.text,
            passWord: passwordController.text,
            passWordConfirmed: rePasswordController.text,
            fullName: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            dob: dobController.text,
            cityId: (cityController.text as num).toInt(),
            selectedFile: selectedFile,
            bytesData: bytesData,
            filename: filename)),
      child: Form(
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
                      const SizedBox(height: 25.0),
                      TextFormFieldCustom(
                          label: "Email",
                          hint: "Nhập email...",
                          icon: Icons.email,
                          isPassword: false,
                          controller: emailController),
                      const SizedBox(height: 25.0),
                      TextFormFieldCustom(
                          label: "Số điện thoại",
                          hint: "Nhập số điện thoại...",
                          icon: Icons.password_sharp,
                          isPassword: false,
                          keyboardType: TextInputType.number,
                          controller: phoneController),
                      const SizedBox(height: 25.0),
                      TextFormFieldBOD(
                          label: 'Ngày sinh nhật',
                          hint: 'Chọn ngày sinh nhật...',
                          controller: dobController,
                          icon: Icons.calendar_month,
                          isPassword: false),
                      const SizedBox(height: 25.0),
                      TextFormFieldCustom(
                          label: 'Địa chỉ',
                          hint: "Nhập địa chỉ...",
                          icon: Icons.home,
                          isPassword: false,
                          controller: addressController),
                      const SizedBox(height: 25.0),
                      DropDownTextFieldCustom(controller: cityController)
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
      ),
    );
  }
}

class TextFormFieldBOD extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  TextInputType? keyboardType;

  TextFormFieldBOD(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.icon,
      required this.isPassword,
      this.keyboardType});

  @override
  State<TextFormFieldBOD> createState() => TextFormFieldBODState();
}

class TextFormFieldBODState extends State<TextFormFieldBOD> {
  bool _isObscure = true;
  final FocusNode _focusnode = FocusNode();
  DateTime? date = DateTime.now();

  @override
  void dispose() {
    _focusnode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _focusnode.addListener(() {
      setState(() {});
    });
    _isObscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          focusNode: _focusnode,
          obscureText: _isObscure,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          onTap: () async {
            date = DateTime(1900);
            FocusScope.of(context).requestFocus(new FocusNode());
            date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now());
            String formateDate = DateFormat('yyy-MM-dd').format(date!);
            widget.controller.text = formateDate;
          },
          decoration: InputDecoration(
            hintText: widget.hint,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              icon: Icon(widget.isPassword
                  ? _isObscure
                      ? Icons.visibility
                      : Icons.visibility_off
                  : null),
              color: _focusnode.hasFocus ? AppColor.primaryDark : null,
            ),
            prefixIcon: Icon(
              widget.icon,
              color: _focusnode.hasFocus ? AppColor.primaryDark : null,
            ),
            focusColor: AppColor.primaryDark,
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: AppColor.primaryDark,
                )),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      ],
    );
  }
}
