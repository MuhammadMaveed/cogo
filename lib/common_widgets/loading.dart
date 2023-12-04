import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingIndicator(){
  return SpinKitCircle(
    size: 50,
    itemBuilder: (context, index) {
      final colors =Color(0xff3669C9);
      //final color = colors[index % colors.length];
      return DecoratedBox(
          decoration: BoxDecoration(
              color: colors,
              shape: BoxShape.circle));
    },
  );
}