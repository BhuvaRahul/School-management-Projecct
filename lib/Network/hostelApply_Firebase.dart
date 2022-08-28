import 'package:firebase_database/firebase_database.dart';
import 'package:global_knowledge_school/screens/studentspages/student_page_data/hostel_apply.dart';

FirebaseDatabase hostelApplyFirebase = FirebaseDatabase.instance;

addHostelApply() async {
  String? key = hostelApplyFirebase.ref('Hostel Apply').push().key;
  await hostelApplyFirebase.ref('Hostel Apply').child(key!).set({
    'name': txtHostelNameController.text,
    'mobileNumber': txtHostelMobilenoController.text,
    'email': txtHostelEmailController.text,
    'std': txtHostelStdController.text,
    'class': txtHostelClasssController.text,
    'rollNo': txtHostelRollController.text,
    'key': key,
  });
}

showHostelApply() async {
  await hostelApplyFirebase.ref('Hostel Apply').once().then((value) {
    Map admission = value.snapshot.value as Map;
    admission.forEach((key, value) {
      hostelApplyDetails.add(value);
    });
  });
}
