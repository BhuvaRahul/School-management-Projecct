import 'package:flutter/material.dart';
import 'package:global_knowledge_school/common/widgets/appbars.dart';
import 'package:global_knowledge_school/common/widgets/text_textstyle.dart';
import 'package:global_knowledge_school/common/widgets/textformfield.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/add_student/add_student_details_widgets.dart';
import 'package:global_knowledge_school/utils/colors.dart';
import 'package:global_knowledge_school/utils/icons.dart';
import 'package:global_knowledge_school/utils/strings.dart';
import '../add_student/add_student_details.dart';

class UpdateStudentDetails extends StatefulWidget {
  //final String id;

  const UpdateStudentDetails({Key? key}) : super(key: key);

  @override
  State<UpdateStudentDetails> createState() => _UpdateStudentDetailsState();
}

class _UpdateStudentDetailsState extends State<UpdateStudentDetails> {
  final key1 = GlobalKey<FormState>();

  // CollectionReference students =
  //     FirebaseFirestore.instance.collection('students');

  // Future<void> updateUser(
  //     id, name, surname, rollNumber, mobile, address, username, password) {
  //   return students
  //       .doc(id)
  //       .update({
  //         'name': name,
  //         'surname': surname,
  //         'rollNumber': rollNumber,
  //         'mobile': mobile,
  //         'address': address,
  //         'username': username,
  //         'password': password
  //       })
  // ignore: avoid_print
  // .then((value) => print("User Updated"))
  // // ignore: avoid_print
  // .catchError((error) => print("Failed to update user: $error"));
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        'Update Student Details',
        style: headingStyle(),
      )),
      body:
          // FutureBuilder(
          //     future: FirebaseFirestore.instance
          //         .collection('students')
          //         .doc(widget.id)
          //         .get(),
          //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //       var data = snapshot.data!.data();
          //       var name = data!['name'];
          //       var surname = data['surname'];
          //       var rollNumber = data['rollNumber'];
          //       var address = data['address'];
          //       var mobile = data['mobile'];
          //       var username = data['username'];
          //       var password = data['password'];
          //       return
          StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Form(
          key: key1,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: commonTextFormField(
                      hintTex: studentFullName,
                      controller: txtNameController,
                      // initialValues: name
                    ),
                  ),
                  Expanded(
                    child: commonTextFormField(
                        controller: txtSurnameController, hintTex: surname),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                    value: selectedStandard,
                    items: [
                      for (int i = 0; i < stdList.length; i++)
                        DropdownMenuItem(
                          child: Text(stdList[i]['std']),
                          value: stdList[i]['std'],
                        )
                    ],
                    /*stdList
                                .map((e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),*/
                    elevation: 6,
                    onChanged: (value) => setState(() {
                      selectedStandard = value.toString();
                    }),
                    hint: const Text(std),
                  ),
                  DropdownButton(
                    value: selectedGender,
                    items: gender
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      selectedGender = value.toString();
                    },
                    hint: const Text(studentGender),
                  ),
                ],
              ),
              commonTextFormField(
                  controller: txtRollNumberController,
                  hintTex: studentRollNumber,
                  // initialValues: rollNumber,
                  keyBordTypes: TextInputType.number),
              commonTextFormField(
                  controller: txtMobileController,
                  hintTex: studentMobileNumber,
                  // initialValues: mobile,
                  keyBordTypes: TextInputType.phone),
              commonTextFormField(
                controller: txtAddressController,
                hintTex: studentAddress,
                //initialValues: address
              ),
              commonTextFormField(
                controller: txtUsernameController,
                hintTex: studentUserName,
                // initialValues: username,
              ),
              commonTextFormField(
                textInputAction: TextInputAction.done,
                controller: txtPasswordController,
                obsecurText: pasword,
                hintTex: studentPassword,
                //initialValues: password,
                sufixIcons: IconButton(
                  onPressed: () {
                    setState(() {
                      pasword = !pasword;
                    });
                  },
                  icon:
                      Icon(pasword ? icVisibiltyOff : icVisibilty, color: grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Update',
                      style: commonStyle(fontColor: white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'Reset',
                      style: commonStyle(fontColor: white),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
