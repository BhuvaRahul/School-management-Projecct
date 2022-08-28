import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/add_student/add_student_details_widgets.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/show_student_details/update_page.dart';

// ignore: must_be_immutable
class AddStudent extends StatefulWidget {
  int i;

  AddStudent({Key? key, required this.i}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
        studentDetails,
        style: headingStyle(),
      )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: stdList[widget.i].isEmpty
                  ? Container()
                  : ListView.builder(
                      itemCount: stdList[widget.i]['studentList'].length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StudentName(
                                        data: stdList[widget.i]['studentList'],
                                        index: index),
                                  ));
                            },
                            child: Card(
                              elevation: 3,
                              margin: const EdgeInsets.all(5),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                height: Screens.height(context) * 0.072,
                                width: Screens.width(context) * 0.63,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    color: yellow50,
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                    stdList[widget.i]['studentList'][index]['name'].toString(),
                                    style: subTitleStyle()),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (cotext) =>
                                        const UpdateStudentDetails()),
                              );
                            },
                            child: const Icon(Icons.edit),
                            color: white,
                            minWidth: 15,
                            shape: const OutlineInputBorder(
                                borderSide: BorderSide()),
                          ),
                          horizontalSpace(
                              horizontal: Screens.width(context) * 0.01),
                          MaterialButton(
                            onPressed: () {},
                            child: const Icon(Icons.delete),
                            color: white,
                            minWidth: 15,
                            shape: const OutlineInputBorder(
                                borderSide: BorderSide()),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(width: 20),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
