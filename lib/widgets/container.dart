import 'package:bmi_calculator/test.dart';
import 'package:flutter/cupertino.dart';

import 'decoration.dart';

Widget BlocContainer(Widget child){
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: DecorationWhite(),
    child: child,
  );
}