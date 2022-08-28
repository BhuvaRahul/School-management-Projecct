import 'package:global_knowledge_school/common_package.dart';

class StudentTimeTables extends StatefulWidget {
  const StudentTimeTables({Key? key}) : super(key: key);

  @override
  State<StudentTimeTables> createState() => _StudentTimeTablesState();
}

class _StudentTimeTablesState extends State<StudentTimeTables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(lable: const Text('Student TimeTable')),
      body: ListView.builder(
          itemCount: studentTimeTable.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => STimeTable(index: index)));
                },
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: Screens.height(context) * 0.072,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: yellow50,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      studentTimeTable[index]['lecture'],
                      style: subTitleStyle(),
                    ),
                  ),
                ),
              )),
    );
  }
}

// ignore: must_be_immutable
class STimeTable extends StatefulWidget {
  int index;

  STimeTable({Key? key, required this.index}) : super(key: key);

  @override
  State<STimeTable> createState() => _STimeTableState();
}

class _STimeTableState extends State<STimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(lable: const Text('Time Table')),
      body: Card(
        elevation: 10,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: Screens.height(context) * 0.245,
          decoration: BoxDecoration(
              color: yellow50, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Subject :- " + studentTimeTable[widget.index]['lecture'],
                  style: commonStyle()),
              const Divider(color: grey),
              Text(
                  "Teacher Name :- " +
                      studentTimeTable[widget.index]['teacherName'],
                  style: commonStyle()),
              const Divider(color: grey),
              Row(
                children: [
                  Text(
                      "Start Time :- " +
                          studentTimeTable[widget.index]['startTime'],
                      style: commonStyle()),
                  Text(
                      "End Time :- " +
                          studentTimeTable[widget.index]['endTime'],
                      style: commonStyle()),
                ],
              ),
              const Divider(color: grey),
              //Text("Day :- " + tabNames[widget.index], style: commonStyle()),
            ],
          ),
        ),
      ),
    );
  }
}
