import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/add_faculty/add_faculty_widjets.dart';
import 'package:global_knowledge_school/screens/facultypages/faculty_data_details/faculty_details/faculty_show.dart';

class FacultyDetails extends StatefulWidget {
  const FacultyDetails({Key? key}) : super(key: key);

  @override
  State<FacultyDetails> createState() => _FacultyDetailsState();
}

class _FacultyDetailsState extends State<FacultyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
            facultyDetails,
            style: headingStyle(),
          ),
          action: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.search),
            )
          ]),
      body: SafeArea(
        child: GridView.builder(
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
                  builder: (context) => ShowDetails(index: index),
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
              )),
            ),
          ),
        ),
      ),
    );
  }
}
