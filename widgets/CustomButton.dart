import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

import 'CustomText.dart';

class CustomButton extends StatelessWidget {
  final Gradient? gradient;
  final Color color;
  final Color borderColor;
  final double height;
  final Widget child;
  final VoidCallback onpress;

  const CustomButton(
      {super.key,
      this.gradient = null,
      this.color = buttonColor,
      this.borderColor=buttonColor,
      this.height = 50,
      required this.child,
      required this.onpress});

//gradient=null,color,width,height,child,onpressed
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(0),
      onPressed: onpress,
      child: Ink(
        decoration: BoxDecoration(
            gradient: gradient,
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border:
                borderColor==color? null :Border.all(color: borderColor)),
        child: Container(
          constraints: BoxConstraints(minHeight: height),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
