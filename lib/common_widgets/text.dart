import 'package:flutter/material.dart';

class OurText extends StatelessWidget {
  const OurText({
    super.key,
    this.text = "",
    this.fontBold,
    this.fontSize,
    this.textColor,
  });

  final String? text;
  final FontWeight? fontBold;
  final double? fontSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style:TextStyle(
          fontWeight: fontBold, fontSize: fontSize, color: textColor),
    );
  }
}
