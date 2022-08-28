import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/add_student/add_student_details_widgets.dart';

// ignore: must_be_immutable
class ShowStudent extends StatelessWidget {
  int i;

  ShowStudent({Key? key, required this.i}) : super(key: key);

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
              child: stdList[i]['studentList'].isEmpty
                  ? Container()
                  : ListView.builder(
                      itemCount: stdList[i]['studentList'].length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentName(
                                    data: stdList[i]['studentList'],
                                    index: index),
                              ));
                        },
                        child: Card(
                          elevation: 3,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: Screens.height(context) * 0.072,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: yellow50,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                                stdList[i]['studentList'][index]['name'],
                                style: subTitleStyle()),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
