import 'package:global_knowledge_school/Network/faculty_firebase.dart';
import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/add_faculty/add_faculty_widjets.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_faculty_detail/show_faculty_details/update_page_faculty.dart';

// ignore: must_be_immutable
class AddFaculty extends StatefulWidget {
  int idx;

  AddFaculty({Key? key, required this.idx}) : super(key: key);

  @override
  State<AddFaculty> createState() => _AddFacultyState();
}

class _AddFacultyState extends State<AddFaculty> {


  @override
  void initState() {
    // TODO: implement initState
    // for (int i = 0; i < subject.length; i++) {
    //   if (selectedDepartment == subject[i]['sub']) {
    //     subject[i]['subList'].clear();
    //   }
    // }
    //showFtyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(lable: Text(facultyDetails, style: headingStyle())),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: subject[widget.idx].isEmpty
                  ? Container()
                  : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: subject[widget.idx]['subList'].length,
                itemBuilder: (context, index) =>
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FacultyName(
                                      fData: subject[widget.idx]['subList'],
                                      index: index,
                                    ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 3,
                            margin: const EdgeInsets.all(5),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: Screens.height(context) * 0.072,
                              width: Screens.width(context) * 0.64,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: yellow50,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(

                                subject[widget.idx]['subList'][index]['name']
                                    .toString(),
                                style: commonStyle(),
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                 UpdateFacultyDetails(updateIdx: index),
                              ),
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
                          onPressed: () {
                            // firebaseDatabase.ref('FacultyData')
                            //     .child(subject[index]['subList'][index]['key']).remove();
                            //     subject[index]['subList'].removeAt(index);
                          },
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
