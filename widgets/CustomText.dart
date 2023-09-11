import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final Alignment align;
  const CustomText({super.key,this.text='',this.color=Colors.white,this.size=16,this.align=Alignment.topLeft});

  @override
  Widget build(BuildContext context) {
    return Container(alignment:align ,
      child: Text(
        text,
        style: TextStyle(fontSize: size, color: color),
      ),
    );
  }
}
