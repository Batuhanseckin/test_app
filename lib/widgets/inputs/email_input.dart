import 'package:flutter/material.dart';
import 'package:test_app/core/manager/ui_helper.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;

  const EmailInput({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: UIHelper.dynamicWidth(10),
        ),
        hintText: 'Email',
        hintStyle: TextStyle(
          color: Color(0xFFD1D1D1),
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: border,
        focusedErrorBorder: errorBorder,
        disabledBorder: errorBorder,
        errorBorder: errorBorder,
        enabledBorder: border,
      ),
      validator: (value) {
        return value.contains(RegExp(
          r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
        ))
            ? null
            : "Check your e-mail address";
      },
    );
  }

  get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Color(0xFFD1D1D1),
          width: 1.0,
        ),
      );

  get errorBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
      );
}
