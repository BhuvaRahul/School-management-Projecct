
import 'package:global_knowledge_school/screens/publicpages/admissionformapply.dart';

addAdmission() async {
  String? key = firebase.ref('admission').push().key;
  await firebase.ref('admission').child(key!).set({
    "name": txtStudNameController.text,
    "class": txtStudClassController.text,
    "father": txtStudFatherController.text,
    "phone": txtStudPhoneController.text,
    "phone1": txtStudPhone1Controller.text,
    "birth": txtStudBirthController.text,
    "address": txtStudAddressController.text,
    "city": txtStudCityController.text,
    "pinCode": txtStudPinCodeController.text,
    "email": txtStudEmailController.text,
    'key': key
  });
}

showAdmission() async {
  await firebase.ref('admission').once().then((value) {
    Map admission = value.snapshot.value as Map;
    admission.forEach((key, value) {
      studApply.add(value);
    });
  });
}

