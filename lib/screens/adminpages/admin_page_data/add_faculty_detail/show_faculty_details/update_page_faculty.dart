import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/add_faculty/add_faculty_widjets.dart';

// ignore: must_be_immutable
class UpdateFacultyDetails extends StatefulWidget {
  int updateIdx;

  UpdateFacultyDetails({Key? key, required this.updateIdx}) : super(key: key);

  @override
  State<UpdateFacultyDetails> createState() => _UpdateFacultyDetailsState();
}

class _UpdateFacultyDetailsState extends State<UpdateFacultyDetails> {
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
        'Update Faculty Details',
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: commonTextFormField(
                        hintTex: facultyName,
                        controller: txtNameController,
                        // initialValues: name
                      ),
                    ),
                    Expanded(
                      child: commonTextFormField(
                        controller: txtSurnameController,
                        hintTex: surname,
                      ),
                    )
                  ],
                ),
                commonTextFormField(
                    controller: txtMobileController,
                    hintTex: facultyMobile,
                    keyBordTypes: TextInputType.number),
                commonTextFormField(
                    controller: txtEmailController,
                    hintTex: facultyEmail,
                    keyBordTypes: TextInputType.emailAddress),
                DropdownButton(
                  value: selectedDepartment,
                  items: [
                    for (int i = 0; i < subject.length; i++)
                      DropdownMenuItem(
                        child: Text(subject[i]['sub']),
                        value: subject[i]['sub'],
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
                    selectedDepartment = value.toString();
                  }),
                  hint: const Text(std),
                ),
                commonTextFormField(
                  controller: txtUsernameController,
                  hintTex: facultyUsername,
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
                    icon: Icon(pasword ? icVisibiltyOff : icVisibilty,
                        color: grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: ()  {
                       // await firebaseDatabase
                       //      .ref('FacultyData')
                       //      .child(subject[widget.updateIdx]['subList']
                       //          [widget.updateIdx]['key'])
                       //      .update({
                       //    'name': txtNameController.text,
                       //    'surname': txtSurnameController.text,
                       //    'mobile': txtMobileController.text,
                       //    'email': txtEmailController.text,
                       //    'department': selectedDepartment,
                       //    'username': txtUsernameController.text,
                       //    'password': txtPasswordController.text,
                       //  });
                        subject[widget.updateIdx]['subList'].clear();
                      // await showFtyData();
                        Navigator.pop(context);
                        setState(() {});
                      },
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
      ),
    );
  }
}
