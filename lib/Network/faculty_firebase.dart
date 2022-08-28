import 'package:firebase_database/firebase_database.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/add_faculty/add_faculty_widjets.dart';

FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

addFtyData() {
  String? key = firebaseDatabase.ref('FacultyData').push().key;
  firebaseDatabase.ref('FacultyData').child(key!).set({
    'name': txtNameController.text,
    'surname': txtSurnameController.text,
    'mobile': txtMobileController.text,
    'email': txtEmailController.text,
    'department': selectedDepartment,
    'username': txtUsernameController.text,
    'password': txtPasswordController.text,
    'key': key
  });
}

showFtyData() {
  for (int i = 0; i < subject.length; i++) {
    subject[i]['subList'].clear();
  }
  firebaseDatabase.ref('FacultyData').once().then((value) {
    Map dataF = value.snapshot.value as Map;

    dataF.forEach((key, value) async {
      for (int i = 0; i < subject.length; i++) {
        if (value["department"].toString() == subject[i]['sub']) {
          await subject[i]['subList'].add(value);
        }
      }
    });
    //print(dataF);
  });
}
