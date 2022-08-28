import 'package:firebase_database/firebase_database.dart';
import 'package:global_knowledge_school/screens/studentspages/student_page_data/apply_leave.dart';

FirebaseDatabase applyLeaveFirebase = FirebaseDatabase.instance;

addApplyLeave() async {
  String? key = applyLeaveFirebase.ref('Apply Leave').push().key;
  await applyLeaveFirebase.ref('Apply Leave').child(key!).set({
    'name': name.text,
    'std': std.text,
    'class': classes.text,
    'form': selectedDate.day.toString() +
        '/' +
        selectedDate.month.toString() +
        '/' +
        selectedDate.year.toString(),
    'to': selectedDate2.day.toString() +
        '/' +
        selectedDate2.month.toString() +
        '/' +
        selectedDate2.year.toString(),
    'reason': reason.text,
    'key': key
  });
}


showLeaveApply(){
  applyLeaveFirebase.ref('Apply Leave').once().then((value) {
    Map leave=value.snapshot.value as Map;
    leave.forEach((key, value) {
      leaveList.add(value);
    });
  });
}


