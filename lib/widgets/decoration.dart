import 'package:flutter/material.dart';

Decoration DecorationWhite() {
  return ShapeDecoration(
    color: Color(0xFFF0F0F3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
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
  );
}
Decoration DecorationBlue() {
  return ShapeDecoration(
    color: Color(0xFF41BEE5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    shadows: [
      BoxShadow(
        color: Color(0x3F000000),
        blurRadius: 4,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ],
  );
}


