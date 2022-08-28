import 'package:flutter/material.dart';
import 'package:global_knowledge_school/utils/colors.dart';

Widget commonButtons({
  required Widget lable,
  double heights = 40,
  double minWidths = 120,
  ShapeBorder? shapes,
  Color? buttonColor,
  required void Function() onPress,
}) {
  return MaterialButton(
    onPressed: onPress,
    child: lable,
    height: heights,
    minWidth: minWidths,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    color: green300,
  );
}
