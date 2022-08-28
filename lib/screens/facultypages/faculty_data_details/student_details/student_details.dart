import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/add_student/add_student_details_widgets.dart';

// ignore: must_be_immutable
class StudentDetails extends StatefulWidget {
  int sIndex;

  StudentDetails({Key? key, required this.sIndex}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        lable: Text(
          studentDetails,
          style: headingStyle(),
        ),
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: GridView.builder(
          itemCount: stdList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 50,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3),
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowStudent(i: index),
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: yellow50,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Text(stdList[index]['std'].toString()),
                ),
              )),
    );
  }
}
