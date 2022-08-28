import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/network/applyLeaveFirebase.dart';
import 'package:global_knowledge_school/screens/studentspages/student_page_data/apply_leave.dart';

class StudentLeave extends StatefulWidget {
  const StudentLeave({Key? key}) : super(key: key);

  @override
  State<StudentLeave> createState() => _StudentLeaveState();
}

class _StudentLeaveState extends State<StudentLeave> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: commonAppbar(
          lable: Text(
            studentLeave,
            style: headingStyle(),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: Key(leaveList[index].toString()),
            onDismissed: (direction) {
              applyLeaveFirebase
                  .ref('Apply Leave')
                  .child(leaveList[index]['key'].toString())
                  .remove();
              leaveList.removeAt(index);
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Name(
                        index: index,
                      ),
                    ));
              },
              child: Card(
                elevation: 3,
                shape:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: Screens.height(context) * 0.073,
                  width: Screens.width(context) * double.infinity,
                  decoration: BoxDecoration(
                      color: yellow50, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      leaveList[index]['name'].toString(),
                      style: subTitleStyle(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          itemCount: leaveList.length,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Name extends StatefulWidget {
  int index;

  Name({Key? key, required this.index}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
            leaveList[widget.index]['name'],
            style: headingStyle(),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name :- ' + leaveList[widget.index]['name'].toString(),
                  style: subTitleStyle()),
              Text('Std :- ' + leaveList[widget.index]['std'].toString(),
                  style: subTitleStyle()),
              Text('Class :- ' + leaveList[widget.index]['class'].toString(),
                  style: subTitleStyle()),
              Row(
                children: [
                  Text('From :- ' + leaveList[widget.index]['form'].toString(),
                      style: subTitleStyle()),
                  horizontalSpace(horizontal: 10),
                  Text('To :- ' + leaveList[widget.index]['to'].toString(),
                      style: subTitleStyle()),
                ],
              ),
              Text('Reason :- ' + leaveList[widget.index]['reason'].toString(),
                  style: subTitleStyle()),
            ],
          ),
        ),
      ),
    );
  }
}

Widget slideLeftBackground() {
  return Container(
    color: red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            icDelete,
            color: white,
          ),
          const Text(
            " Delete",
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          horizontalSpace(horizontal: 20),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
