import 'package:flutter/material.dart';

Widget verticalSpace({double? vertical, Widget? childs}) =>
    SizedBox(height: vertical);

Widget horizontalSpace({Widget? childs, double? horizontal}) => SizedBox(width: horizontal);
