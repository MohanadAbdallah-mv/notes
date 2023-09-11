import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

import 'CustomText.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final String headerText;
  final String hint;

  const CustomTextField(
      {super.key, this.isPassword = false,required this.headerText, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: headerText,
          size: 16,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            cursorColor: focusColor,
            obscureText: isPassword,
            autocorrect: !isPassword,
            keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: buttonBorderColor)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: focusColor),
                )))
      ],
    );
  }
}
