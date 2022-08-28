import 'package:flutter/material.dart';
TextEditingController txtLectureController = TextEditingController();
TextEditingController txtStandardController = TextEditingController();
TextEditingController txtStartTimeController = TextEditingController();
TextEditingController txtEndTimeController = TextEditingController();

Widget lectureTextField(){
  return TextField(
    expands: false,
    controller: txtLectureController,
    enableInteractiveSelection: true,
    textInputAction: TextInputAction.done,
    decoration: const InputDecoration(
      labelText: 'Lecture',
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget standardTextField(){
 return  TextField(
    expands: false,
    controller: txtStandardController,
    enableInteractiveSelection: true,
    autocorrect: true,
    textInputAction: TextInputAction.done,
    decoration: const InputDecoration(
      labelText: 'Standard + Div',
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget starttimeTExtField(){
  return  Expanded(
    child: TextField(
      expands: false,
      controller: txtStartTimeController,
      enableInteractiveSelection: true,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'Start time',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget endtimeTextField(){
  return Expanded(
    child: TextField(
      expands: false,
      controller: txtEndTimeController,
      enableInteractiveSelection: true,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        labelText: 'End time',
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}


List<Map> facultyTimeTable = [];