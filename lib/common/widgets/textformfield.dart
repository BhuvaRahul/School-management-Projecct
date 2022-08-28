import 'package:flutter/material.dart';
import '../../utils/colors.dart';

Widget commonTextFormField({
  required TextEditingController controller,
  required hintTex,
  bool obsecurText = false,
  double borderRadius = 15,
  double padding = 5,
  String? initialValues,
  Color borderColor = black,
  TextInputType? keyBordTypes,
  Widget? sufixIcons,
  Widget? prefixIcons,
  validator,
  dynamic textInputAction = TextInputAction.next,
  IconButton? suffixIcons,
}) =>
    Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obsecurText,
        textInputAction: textInputAction,
        keyboardType: keyBordTypes,
        initialValue: initialValues,
        decoration: InputDecoration(
          suffixIcon: sufixIcons,
          prefixIcon: prefixIcons,
          hintText: hintTex,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          // iconColor: black
        ),
      ),
    );

Widget loginTextFormField({
  required TextEditingController controllers,
  required obscureText,
  required hintTxt,
  validator,
  Widget? suffixIc,
  double borderRadius = 20,
  Color borderColor = black,
  dynamic textInputAction = TextInputAction.next,

}) =>
    TextFormField(
      controller: controllers,
      obscureText: obscureText,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintTxt,

        suffixIcon: suffixIc,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );

