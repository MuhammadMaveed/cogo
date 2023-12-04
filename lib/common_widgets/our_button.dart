import 'package:flutter/material.dart';

Widget OurButton({
  String? title,
  onPress,
  textColor,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3669C9),
          disabledBackgroundColor: Color(0xff3669C9)),
      onPressed: onPress,
      child: Text(
        title!,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ));
}
