import 'package:global_knowledge_school/Network/student_firebase.dart';
import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/add_student/add_student_details_widgets.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/show_student_details/show_student_details.dart';

class Standard extends StatefulWidget {
  const Standard({Key? key}) : super(key: key);

  @override
  State<Standard> createState() => _StandardState();
}

class _StandardState extends State<Standard> {
  final studKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < stdList.length; i++) {
      if (selectedStandard == stdList[i]['std']) {
        stdList[i]['studentList'].clear();
      }
    }
    showStdData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        addStudent,
        style: headingStyle(),
      )),
      floatingActionButton: commonFloatingActionButton(
          onPress: () {
        showDialog(
          context: context,
          builder: (context) => SingleChildScrollView(
            child: AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) => Form(
                  key: studKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: commonTextFormField(
                              hintTex: studentFullName,
                              controller: txtNameController,
                            ),
                          ),
                          Expanded(
                            child: commonTextFormField(
                                controller: txtSurnameController,
                                hintTex: surname),
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
                          keyBordTypes: TextInputType.number),
                      commonTextFormField(
                          controller: txtMobileController,
                          hintTex: studentMobileNumber,
                          keyBordTypes: TextInputType.phone),
                      commonTextFormField(
                        controller: txtAddressController,
                        hintTex: studentAddress,
                      ),
                      commonTextFormField(
                        controller: txtUsernameController,
                        hintTex: studentUserName,
                      ),
                      commonTextFormField(
                        textInputAction: TextInputAction.done,
                        controller: txtPasswordController,
                        obsecurText: pasword,
                        hintTex: studentPassword,
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
                    ],
                  ),
                ),
              ),
              actions: [
                commonButtons(
                    lable: Text(
                      cancel,
                      style: commonStyle(),
                    ),
                    onPress: () {
                      Navigator.pop(context);
                    }),
                SizedBox(width: Screens.width(context) * 0.01),
                commonButtons(
                  lable: Text(submit, style: commonStyle()),
                  onPress: () async {
                    await addStdData();
                    await showStdData();
                    for (int i = 0; i < stdList.length; i++) {
                      if (selectedStandard == stdList[i]['std']) {
                        stdList[i]['studentList'].clear();
                      }
                     }
                    setState(() {});
                    clearStudent();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      }),
      body: SafeArea(
        child: GridView.builder(
          itemCount: stdList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              mainAxisExtent: 50),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddStudent(i: index),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: yellow50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all()),
              alignment: Alignment.center,
              child: Text(
                stdList[index]['std'].toString(),
                style: commonStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// class StudentStream {
//   static StreamController streamControllerData = StreamController();
//
//   static get streamStudent => streamControllerData.stream;
//
//   static get sinkStudent => streamControllerData.sink;
//
//   static set student(List data) => sinkStudent.add(data);
// }
