import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/network/timetableFirebase.dart';
// import 'package:path/path.dart';

String? selectedDay;

class TeachersTimeTable extends StatefulWidget {
  final bool edit;

  const TeachersTimeTable({Key? key, this.edit = false}) : super(key: key);

  @override
  _TeachersTimeTableState createState() => _TeachersTimeTableState();
}

class _TeachersTimeTableState extends State<TeachersTimeTable> {
  clearFacultyField() {
    txtLectureController.clear();
    txtStandardController.clear();
    txtStartTimeController.clear();
    txtEndTimeController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showTimetableFaculty();
    facultyTimeTable.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: green300,
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) => ListView.builder(
                itemCount: facultyTimeTable.length,
                itemBuilder: (context, index) => Dismissible(
                  key: Key(facultyTimeTable[index].toString()),
                  onDismissed: (direction) {
                    timetableFirebase
                        .ref('Faculty Timetable')
                        .child(facultyTimeTable[index]['key'])
                        .remove();
                    facultyTimeTable.removeAt(index);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateTimetableFaculty(
                              index: index,
                            ),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: yellow50,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lecture :-" +
                                facultyTimeTable[index]['lecture'].toString(),
                            style: commonStyle(),
                          ),
                          const Divider(
                            color: grey,
                          ),
                          Text(
                            "Standard :-" +
                                facultyTimeTable[index]['standard'].toString(),
                            style: commonStyle(),
                          ),
                          const Divider(
                            color: grey,
                          ),
                          Row(
                            children: [
                              Text(
                                "Start Time :-" +
                                    facultyTimeTable[index]['startTime']
                                        .toString(),
                                style: commonStyle(),
                              ),
                              horizontalSpace(horizontal: 5),
                              Text(
                                "End Time :-" +
                                    facultyTimeTable[index]['endTime']
                                        .toString(),
                                style: commonStyle(),
                              )
                            ],
                          ),
                          const Divider(
                            color: grey,
                          ),
                          Text(
                            'Day :-' +
                                facultyTimeTable[index]['day'].toString(),
                            style: commonStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          label: Text(
            'Time table',
            style: subTitleStyle(),
          ),
        ),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              lectureTextField(),
              standardTextField(),
              Row(
                children: <Widget>[
                  starttimeTExtField(),
                  const Text(
                    "  To  ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  endtimeTextField()
                ],
              ),
              verticalSpace(vertical: Screens.height(context) * 0.03),
              DropdownButton(
                  value: selectedDay,
                  items: days
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: (e),
                          ))
                      .toList(),
                  elevation: 6,
                  onChanged: (value) => setState(() {
                        selectedDay = value.toString();
                      }),
                  hint: const Text('day')),
              commonButtons(
                  lable: const Text('Save'),
                  onPress: () async {
                    await addTimetableFaculty();

                    clearFacultyField();
                    facultyTimeTable.clear();
                    await showTimetableFaculty();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class UpdateTimetableFaculty extends StatefulWidget {
  int index;

  UpdateTimetableFaculty({Key? key, required this.index}) : super(key: key);

  @override
  State<UpdateTimetableFaculty> createState() => _UpdateTimetableFacultyState();
}

class _UpdateTimetableFacultyState extends State<UpdateTimetableFaculty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green300,
        title: Text(
          'Update Timetable Faculty',
          style: headingStyle(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              lectureTextField(),
              standardTextField(),
              Row(
                children: <Widget>[
                  starttimeTExtField(),
                  const Text(
                    "  To  ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  endtimeTextField()
                ],
              ),
              verticalSpace(vertical: Screens.height(context) * 0.03),
              DropdownButton(
                  value: selectedDay,
                  items: days
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: (e),
                          ))
                      .toList(),
                  elevation: 6,
                  onChanged: (value) => setState(() {
                        selectedDay = value.toString();
                      }),
                  hint: const Text('day')),
              commonButtons(
                  lable: const Text('Save'),
                  onPress: () async {
                    await timetableFirebase
                        .ref('Faculty Timetable')
                        .child(facultyTimeTable[widget.index]['key'])
                        .update({
                      'lecture': txtLectureController.text,
                      'standard': txtStandardController.text,
                      'startTime': txtStartTimeController.text,
                      'endTime': txtEndTimeController.text,
                      'day': selectedDay.toString(),
                    });
                    facultyTimeTable.clear();
                    showTimetableFaculty();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
