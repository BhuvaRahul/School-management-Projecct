import 'package:global_knowledge_school/common_package.dart';

TextEditingController txtSurnameController = TextEditingController();
TextEditingController txtNameController = TextEditingController();
TextEditingController txtMobileController = TextEditingController();
TextEditingController txtEmailController = TextEditingController();
TextEditingController txtUsernameController = TextEditingController();
TextEditingController txtPasswordController = TextEditingController();
bool pasword = true;
String? selectedDepartment;


clearFacultyData() {
  txtUsernameController.clear();
  txtSurnameController.clear();
  txtPasswordController.clear();
  txtEmailController.clear();
  txtMobileController.clear();
  txtNameController.clear();
}

List<Map> subject = [
  {'sub': 'Gujarati', 'subList': []},
  {'sub': 'Hindi', 'subList': []},
  {'sub': 'Sanskrit', 'subList': []},
  {'sub': 'Science', 'subList': []},
  {'sub': 'Maths', 'subList': []},
  {'sub': 'English', 'subList': []},
  {'sub': 'S.S', 'subList': []},
  {'sub': 'Computer', 'subList': []},
  {'sub': 'Draw', 'subList': []},
  {'sub': 'P.T', 'subList': []},
  {'sub': 'Biology', 'subList': []},
  {'sub': 'Physics', 'subList': []},
  {'sub': 'Chemistry', 'subList': []},
  {'sub': 'Stat', 'subList': []},
  {'sub': 'Account', 'subList': []},
  {'sub': 'Economics', 'subList': []},
  {'sub': 'S.P & CC', 'subList': []},
];
