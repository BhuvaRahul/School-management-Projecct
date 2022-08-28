import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/network/timetableFirebase.dart';

TextEditingController txtSubjectNameController = TextEditingController();
TextEditingController txtTeacherNameController = TextEditingController();
TextEditingController txtLecStartController = TextEditingController();
TextEditingController txtLecEndController = TextEditingController();
String? selectedValue;

class StudentsTimeTable extends StatefulWidget {
  // final bool edit;

  const StudentsTimeTable({
    Key? key,
  }) : super(key: key);

  @override
  _StudentsTimeTableState createState() => _StudentsTimeTableState();
}

class _StudentsTimeTableState extends State<StudentsTimeTable> {
  // bool edit = false;

  clearStudTimetable() {
    txtSubjectNameController.clear();
    txtTeacherNameController.clear();
    txtLecStartController.clear();
    txtLecEndController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showTimetableStudent();
    studentTimeTable.clear();
  }

  @override
  Widget build(BuildContext context) {
    // edit = widget.edit;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // studentTimeTable.clear();
            // showTimetableStudent();
            showBottomSheet(
                context: context,
                builder: (context) => ListView.builder(
                      itemCount: studentTimeTable.length,
                      itemBuilder: (context, index) => Dismissible(
                        key: Key(studentTimeTable[index].toString()),
                        onDismissed: (direction) {
                          timetableFirebase
                              .ref('Student Timetable')
                              .child(studentTimeTable[index]['key'])
                              .remove();
                          studentTimeTable.removeAt(index);
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateTimetableStudent(
                                    index: index,
                                  ),
                                ));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: yellow50,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Subject :- " +
                                      studentTimeTable[index]['lecture'],
                                  style: commonStyle(),
                                ),
                                const Divider(color: grey),
                                Text(
                                  "Teacher Name :- " +
                                      studentTimeTable[index]['teacherName'],
                                  style: commonStyle(),
                                ),
                                const Divider(color: grey),
                                Row(
                                  children: [
                                    Text(
                                      "Start Time :- " +
                                          studentTimeTable[index]['startTime'],
                                      style: commonStyle(),
                                    ),
                                    Text(
                                      "   End Time :- " +
                                          studentTimeTable[index]['endTime'],
                                      style: commonStyle(),
                                    ),
                                  ],
                                ),
                                const Divider(color: grey),
                                Text(
                                  "Day :- " + studentTimeTable[index]['day'],
                                  style: commonStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
          },
          label: Text(
            'Timetable',
            style: subTitleStyle(),
          ),
          backgroundColor: green300,
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                expands: false,
                controller: txtSubjectNameController,
                enableInteractiveSelection: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Lecture',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                expands: false,
                controller: txtTeacherNameController,
                enableInteractiveSelection: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Teacher name',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      expands: false,
                      controller: txtLecStartController,
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Start time',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "  To  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      expands: false,
                      controller: txtLecEndController,
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'End time',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(
                vertical: Screens.height(context) * 0.03,
              ),
              DropdownButton(
                value: selectedValue,
                items: days
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: (e),
                        ))
                    .toList(),
                elevation: 6,
                onChanged: (value) => setState(() {
                  selectedValue = value.toString();
                }),
                hint: const Text('Day'),
              ),
              commonButtons(
                  lable: const Text('Save'),
                  onPress: () async {
                    await addTimetableStudent();
                    //print(studentTimeTable);
                    clearStudTimetable();
                    studentTimeTable.clear();
                    await showTimetableStudent();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> studentTimeTable = [];

List days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];

// ignore: must_be_immutable
class UpdateTimetableStudent extends StatefulWidget {
  int index;

  UpdateTimetableStudent({Key? key, required this.index}) : super(key: key);

  @override
  State<UpdateTimetableStudent> createState() => _UpdateTimetableStudentState();
}

class _UpdateTimetableStudentState extends State<UpdateTimetableStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green300,
        title: Text(
          'Update Timetable Student',
          style: headingStyle(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                expands: false,
                controller: txtSubjectNameController,
                enableInteractiveSelection: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Lecture',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                expands: false,
                controller: txtTeacherNameController,
                enableInteractiveSelection: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Teacher name',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      expands: false,
                      controller: txtLecStartController,
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Start time',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "  To  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      expands: false,
                      controller: txtLecEndController,
                      enableInteractiveSelection: true,
                      keyboardType: TextInputType.datetime,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'End time',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(
                vertical: Screens.height(context) * 0.03,
              ),
              DropdownButton(
                value: selectedValue,
                items: days
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: (e),
                        ))
                    .toList(),
                elevation: 6,
                onChanged: (value) => setState(() {
                  selectedValue = value.toString();
                }),
                hint: const Text('Day'),
              ),
              commonButtons(
                  lable: const Text('Save'),
                  onPress: () async {
                    await timetableFirebase
                        .ref('Student Timetable')
                        .child(studentTimeTable[widget.index]['key'])
                        .update({
                      'lecture': txtSubjectNameController.text,
                      'teacherName': txtTeacherNameController.text,
                      'startTime': txtLecStartController.text,
                      'endTime': txtLecEndController.text,
                      'day': selectedValue.toString(),
                    });
                    studentTimeTable.clear();
                    showTimetableStudent();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
