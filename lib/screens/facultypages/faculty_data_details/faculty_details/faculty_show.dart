import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/add_faculty/add_faculty_widjets.dart';

// ignore: must_be_immutable
class ShowDetails extends StatefulWidget {
  int index;

  ShowDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          lable: Text(
            facultyDetails,
            style: headingStyle(),
          )),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: subject[widget.index]['subList'].length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FacultyName(
                    fData: subject[widget.index]['subList'],
                    index: index,
                  )),
            );
          },
          child: Card(
            elevation: 3,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: Screens.height(context) * 0.072,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: yellow50, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  subject[widget.index]['subList'][index]['name'],
                  style: commonStyle(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

