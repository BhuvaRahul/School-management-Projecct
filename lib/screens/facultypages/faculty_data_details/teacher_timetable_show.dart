import 'package:global_knowledge_school/common_package.dart';

class FacultyTimeTables extends StatefulWidget {
  const FacultyTimeTables({Key? key}) : super(key: key);

  @override
  State<FacultyTimeTables> createState() => _FacultyTimeTablesState();
}

class _FacultyTimeTablesState extends State<FacultyTimeTables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          commonAppbar(lable: Text('Teacher Timetable', style: headingStyle())),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: facultyTimeTable.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FacTimeTable(index: index),
                          ));
                    },
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        height: Screens.height(context) * 0.072,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: yellow50,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(facultyTimeTable[index]['standard']),
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FacTimeTable extends StatefulWidget {
  int index;

  FacTimeTable({Key? key, required this.index}) : super(key: key);

  @override
  State<FacTimeTable> createState() => _FacTimeTableState();
}

class _FacTimeTableState extends State<FacTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        'Time Table',
        style: headingStyle(),
      )),
      body: Card(
        elevation: 10,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: Screens.height(context) * 0.245,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: yellow50, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lecture :- " + facultyTimeTable[widget.index]['lecture'],
                  style: commonStyle()),
              const Divider(color: grey),
              Text("Standard :- " + facultyTimeTable[widget.index]['standard'],
                  style: commonStyle()),
              const Divider(color: grey),
              Row(
                children: [
                  Text(
                      "Start Time :- " +
                          facultyTimeTable[widget.index]['startTime'],
                      style: commonStyle()),
                  horizontalSpace(horizontal: Screens.width(context) * 0.04),
                  Text(
                      "End Time :- " +
                          facultyTimeTable[widget.index]['endTime'],
                      style: commonStyle()),
                ],
              ),
              const Divider(color: grey),
              //Text("Day :- " + tabNames[widget.index].toString(), style: commonStyle()),
            ],
          ),
        ),
      ),
    );
  }
}
