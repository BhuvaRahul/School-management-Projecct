import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/add_student/add_student_details_widgets.dart';

FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

addStdData()  {
  String? key = firebaseDatabase.ref('StudentData').push().key;
   firebaseDatabase.ref('StudentData').child(key!).set({
    'name': txtNameController.text,
    'surname': txtSurnameController.text,
    'std': selectedStandard,
    'gender': selectedGender,
    'rollNumber': txtRollNumberController.text,
    'mobile': txtMobileController.text,
    'address': txtAddressController.text,
    'username': txtUsernameController.text,
    'password': txtPasswordController.text,
    'key': key,
  });
}

showStdData()  {
  for (int i = 0; i < stdList.length; i++) {

      stdList[i]['studentList'].clear();

  }
   firebaseDatabase.ref('StudentData').once().then((value) {
    Map stdData = value.snapshot.value as Map;
    stdData.forEach((key, value)  async {
      for (int i = 0; i < stdList.length; i++) {
        if (value["std"].toString() == stdList[i]['std'].toString()) {
        await  stdList[i]['studentList'].add(value);
        }

        //print(stdList[i]['studentList']);
      }
    });
    print(stdData);
  });
}