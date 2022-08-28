import 'package:flutter/material.dart';
import '../../utils/colors.dart';

Widget commonAppContainer() {
  return Container(
    height: 56,
    width: 60,
    decoration: BoxDecoration(
      color: white,
      border: Border.all(color: black),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      image: const DecorationImage(
          image: AssetImage('assets/images/school logo.png'), fit: BoxFit.fill),
    ),
  );
}

Widget smallContainer({
  double? height,
  double? width,
  double? height1,
  double? width1,
  String? txt,
  double left =35,
  required Widget? text,
  required Widget? label,
}) {
  return Stack(
    children: [
      Container(
        height: 50,
        width: width,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 5),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: yellow50,
          borderRadius: BorderRadius.circular(20),
            border: Border.all(color: black, width: 2)
        ),
        child: text,
      ),
  Container(
    height: 20,
    width: width1,
    margin: EdgeInsets.only(left: left,),
    decoration: BoxDecoration(
      color: white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: black, width: 1)
    ),
    child: Center(child: label),
  )
    ],
  );
}


