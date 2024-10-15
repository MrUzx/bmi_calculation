import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TypeText(String title) {
  return Text(
    title,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Color(0xFF7C7C7C),
    ),
  );
}

Widget Count(String count) {
  return Text(
    count.toString(),
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 42,
      color: Colors.black87,
    ),
  );
}
