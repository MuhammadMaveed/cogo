import 'package:flutter/material.dart';


class OurButton extends StatelessWidget {
  const OurButton(
      {super.key,
      this.text = "",
      this.fontBold = FontWeight.w500,
      this.fontSize = 15,
      this.textColor = Colors.white,
      this.height = 58,
      this.width = double.infinity,
      this.borderRadius = 10,
      this.borderColor =Colors.deepPurpleAccent,
      this.backgroundColor =Colors.deepPurple,
      this.onPress});

  final String? text;
  final FontWeight? fontBold;
  final double? fontSize;
  final double? height;
  final double? borderRadius;
  final double? width;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap:onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            border: Border.all(color: borderColor!, width: 2),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              text!,
              style:TextStyle(
                  fontWeight: fontBold, fontSize: fontSize, color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
