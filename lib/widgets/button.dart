import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ButtonDesign(IconData icon) {
  return Container(
    width: 50,
    height: 50,
    decoration: ShapeDecoration(
      color: Color(0xFFF0F0F3),
      shape: OvalBorder(),
      shadows: [
        BoxShadow(
          color: Color(0xFFFFFFFF),
          blurRadius: 11,
          offset: Offset(-2.18, -2.18),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x66AEAEC0),
          blurRadius: 6.54,
          offset: Offset(2.18, 2.18),
          spreadRadius: 0,
        )
      ],
    ),
    child: Center(
      child: Icon(
        icon,
        size: 28,
        color: Color(0xFF41BEE5),
      ),
    ),
  );
}
