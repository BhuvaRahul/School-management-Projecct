import 'package:global_knowledge_school/common_package.dart';

TextEditingController txtNameController = TextEditingController();
TextEditingController txtSurnameController = TextEditingController();
TextEditingController txtStdController = TextEditingController();
TextEditingController txtClassController = TextEditingController();
TextEditingController txtRollNumberController = TextEditingController();
TextEditingController txtMobileController = TextEditingController();
TextEditingController txtAddressController = TextEditingController();
TextEditingController txtUsernameController = TextEditingController();
TextEditingController txtPasswordController = TextEditingController();
bool pasword = true;
String? selectedStandard;
String? selectedGender;


clearStudent() {
  txtNameController.clear();
  txtSurnameController.clear();
  txtRollNumberController.clear();
  txtMobileController.clear();
  txtAddressController.clear();
  txtUsernameController.clear();
  txtPasswordController.clear();
  selectedStandard = null;
  selectedGender = null;
}

List gender = [
  'Male',
  'Female',
  'Other',
];

List<Map> stdList = [
  {'std': '1-A', 'studentList': []},
  {'std': '1-B', 'studentList': []},
  {'std': '1-C', 'studentList': []},
  {'std': '2-A', 'studentList': []},
  {'std': '2-B', 'studentList': []},
  {'std': '2-C', 'studentList': []},
  {'std': '3-A', 'studentList': []},
  {'std': '3-B', 'studentList': []},
  {'std': '3-C', 'studentList': []},
  {'std': '4-A', 'studentList': []},
  {'std': '4-B', 'studentList': []},
  {'std': '4-C', 'studentList': []},
  {'std': '5-A', 'studentList': []},
  {'std': '5-B', 'studentList': []},
  {'std': '5-C', 'studentList': []},
  {'std': '6-A', 'studentList': []},
  {'std': '6-B', 'studentList': []},
  {'std': '6-C', 'studentList': []},
  {'std': '7-A', 'studentList': []},
  {'std': '7-B', 'studentList': []},
  {'std': '7-C', 'studentList': []},
  {'std': '8-A', 'studentList': []},
  {'std': '8-B', 'studentList': []},
  {'std': '8-C', 'studentList': []},
  {'std': '9-A', 'studentList': []},
  {'std': '9-B', 'studentList': []},
  {'std': '9-C', 'studentList': []},
  {'std': '10-A', 'studentList': []},
  {'std': '10-B', 'studentList': []},
  {'std': '10-C', 'studentList': []},
  {'std': '11 Com-A', 'studentList': []},
  {'std': '11 Com-B', 'studentList': []},
  {'std': '11 Com-C', 'studentList': []},
  {'std': '11 Sci-A', 'studentList': []},
  {'std': '11 Sci-B', 'studentList': []},
  {'std': '11 Sci-C', 'studentList': []},
  {'std': '12 Com-A', 'studentList': []},
  {'std': '12 Com-B', 'studentList': []},
  {'std': '12 Com-C', 'studentList': []},
  {'std': '12 Sci-A', 'studentList': []},
  {'std': '12 Sci-B', 'studentList': []},
  {'std': '12 Sci-C', 'studentList': []},
];


// Widget slideLeftBackground() {
//   return Container(
//     color: red,
//     child: Align(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Icon(
//             icDelete,
//             color: white,
//           ),
//           const Text(
//             " Delete",
//             style: TextStyle(
//               color: white,
//               fontWeight: FontWeight.w700,
//             ),
//             textAlign: TextAlign.right,
//           ),
//           horizontalSpace(horizontal: 20),
//         ],
//       ),
//       alignment: Alignment.centerRight,
//     ),
//   );
// }
