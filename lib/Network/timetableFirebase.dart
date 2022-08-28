import 'package:firebase_database/firebase_database.dart';
import 'package:global_knowledge_school/common_package.dart';

FirebaseDatabase timetableFirebase = FirebaseDatabase.instance;

addTimetableStudent() async {
  String? key = timetableFirebase.ref('Student Timetable').push().key;
  await timetableFirebase.ref('Student Timetable').child(key!).set({
    'lecture': txtSubjectNameController.text,
    'teacherName': txtTeacherNameController.text,
    'startTime': txtLecStartController.text,
    'endTime': txtLecEndController.text,
    'day': selectedValue.toString(),
    'key': key
  });
}

showTimetableStudent() async {
  await timetableFirebase.ref('Student Timetable').once().then((value) {
    Map timetable = value.snapshot.value as Map;
    timetable.forEach((key, value) {
      studentTimeTable.add(value);
    });
  });
}

addTimetableFaculty() async {
  String? key = timetableFirebase.ref('Faculty Timetable').push().key;
  await timetableFirebase.ref('Faculty Timetable').child(key!).set({
    'lecture': txtLectureController.text,
    'standard': txtStandardController.text,
    'startTime': txtStartTimeController.text,
    'endTime': txtEndTimeController.text,
    'day': selectedDay.toString(),
    'key': key
  });
}

showTimetableFaculty() {
  timetableFirebase.ref('Faculty Timetable').once().then((value) {
    Map timetable = value.snapshot.value as Map;
    timetable.forEach((key, value) {
      facultyTimeTable.add(value);
    });
  });
}
