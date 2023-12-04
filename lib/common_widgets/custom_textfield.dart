import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget CustomTextfield(
    {bool isOb = false,
    String? hintText="",
    String? title="",
    controller,
    suffIcon,
    int? maxLines = 1}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Color(0xff695C5C)).fontWeight(FontWeight.bold).size(14).make(),
      5.heightBox,
      TextFormField(
        maxLines: maxLines!,
        controller: controller,
        obscureText: isOb,
        decoration: InputDecoration(
          fillColor: Color(0xffFAFAFA),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff000000),
            fontSize: 16,
          ),
          suffixIcon: suffIcon,
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
