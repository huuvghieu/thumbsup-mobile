import 'package:flutter/material.dart';

import '../../common/color.dart';

class TextFormFieldCustom extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  const TextFormFieldCustom(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.icon,
      required this.isPassword,
      });

  @override
  State<TextFormFieldCustom> createState() => TextFormFieldCustomState();
}

class TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool _isObscure = true;
  final FocusNode _focusnode = FocusNode();

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
          controller: widget.controller,
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
