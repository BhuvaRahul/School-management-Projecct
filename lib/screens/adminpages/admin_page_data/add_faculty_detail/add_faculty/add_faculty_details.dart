import 'package:global_knowledge_school/Network/faculty_firebase.dart';
import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/add_faculty/add_faculty_widjets.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/show_faculty_details/show_faculty_details.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  final key1 = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showFtyData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        'Faculties',
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
                    key: key1,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: commonTextFormField(
                                hintTex: facultyName,
                                controller: txtNameController,
                              ),
                            ),
                            Expanded(
                                child: commonTextFormField(
                                    controller: txtSurnameController,
                                    hintTex: surname))
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
                                value: subject[i]['sub'],
                                child: Text(subject[i]['sub']),
                              )
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedDepartment = value.toString();
                            });
                          },
                          elevation: 6,
                          hint: const Text(facultyDepartment),
                        ),
                        commonTextFormField(
                          controller: txtUsernameController,
                          hintTex: facultyUsername,
                        ),
                        commonTextFormField(
                          textInputAction: TextInputAction.done,
                          controller: txtPasswordController,
                          obsecurText: pasword,
                          hintTex: facultyPassword,
                          sufixIcons: IconButton(
                            onPressed: () {
                              pasword = !pasword;
                              setState(() {});
                            },
                            icon: Icon(
                              pasword ? icVisibiltyOff : icVisibilty,
                              color: grey,
                            ),
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
                  horizontalSpace(horizontal: Screens.width(context) * 0.01),
                  commonButtons(
                    lable: Text(submit, style: commonStyle()),
                    onPress: () async {
                      // for (int i = 0; i < subject.length; i++) {
                      //   if (selectedDepartment == subject[i]['sub']) {
                      //     subject[i]['subList'].add({
                      //       'name': txtNameController.text,
                      //       'surname': txtSurnameController.text,
                      //       'mobile': txtMobileController.text,
                      //       'email': txtEmailController.text,
                      //       'department': selectedDepartment,
                      //       'username': txtUsernameController.text,
                      //       'password': txtPasswordController.text,
                      //     });
                      //   }
                      // }
                      await addFtyData();
                      await showFtyData();
                      for (int i = 0; i < subject.length; i++) {
                        if (selectedDepartment == subject[i]['sub']) {
                          subject[i]['subList'].clear();
                        }
                      }
                      setState(() {});
                      clearFacultyData();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: subject.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 60,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddFaculty(idx: index),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: yellow50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all()),
            margin: const EdgeInsets.all(4),
            child: Center(
              child: Text(
                subject[index]['sub'].toString(),
                style: commonStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
