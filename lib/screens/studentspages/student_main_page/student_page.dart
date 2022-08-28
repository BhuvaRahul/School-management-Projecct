import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/login_sharedprefrences.dart';
import 'package:global_knowledge_school/screens/studentspages/student_page_data/apply_leave.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green300,
        leading: commonAppContainer(),
        title: Row(
          children: [
            horizontalSpace(horizontal: Screens.width(context) * 0.05),
            const AutoSizeText(
              student,
              presetFontSizes: [23, 22, 20],
              style: TextStyle(color: black),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
                child: CircleAvatar(
              radius: 60,
              backgroundColor: white,
              backgroundImage: AssetImage('assets/images/school logo.png'),
            )),
            Expanded(
              child: ListView.separated(
                itemCount: drawer.length,
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(drawer[index]['ic']),
                  title: Text(drawer[index]['txt'], style: commonStyle()),
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ApplyLeave(),
                          ));
                    }
                    if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HostelApply(),
                          ));
                    }
                    if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeesPay(),
                          ));
                    }
                    if (index == 3) {
                      LogInSharedPrefrence.setStudLoginUser = '';
                      LogInSharedPrefrence.setStudLoginPass = '';
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EnterPage()),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.31,
          children: List.generate(
              stdPage.length,
              (index) => Column(
                    children: [
                      verticalSpace(
                          vertical: Screens.height(context) * 0.023),
                      GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowHomework(
                                    homeworkIndex: index,
                                    homework: homeworkShow[index]
                                        ['homeworkList'],
                                  ),
                                ));
                          }
                          if (index == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ApplyLeave()));
                          }
                          if (index == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentTimeTables()));
                          }
                          if (index == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HostelApply(),
                                ));
                          }
                          if (index == 6) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FeesPay(),
                                ));
                          }
                          if (index == 7) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FacultyDetails(),
                                ));
                          }
                        },
                        child: Card(
                          elevation: 10,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          child: Container(
                            height: 90,
                            width: Screens.width(context) * 0.41,
                            decoration: BoxDecoration(
                              color: green300,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(stdPage[index]['ic']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      Text(stdPage[index]['tlt'], style: commonStyle()),
                    ],
                  )),
        ),
      ),
    );
  }
}

List<Map> stdPage = [
  {'tlt': 'HomeWork', 'ic': 'assets/images/homework.png'},
  {'tlt': 'Apply Leave', 'ic': 'assets/images/leave.png'},
  {'tlt': 'Time Table', 'ic': 'assets/images/timetbl.png'},
  {'tlt': 'Hostel Apply', 'ic': 'assets/images/hostl.png'},
  {'tlt': 'Attendance', 'ic': 'assets/images/attandance.png'},
  {'tlt': 'Festival Images', 'ic': 'assets/images/festivl.png'},
  {'tlt': 'Fees', 'ic': 'assets/images/fee.png'},
  {'tlt': 'Faculty Details', 'ic': 'assets/images/happystf.png'},
];

List drawer = [
  {'txt': 'Apply Leave', 'ic': Icons.access_time},
  {'txt': 'Hostel Apply', 'ic': Icons.home_work_outlined},
  {'txt': 'Fees', 'ic': Icons.money},
  {'txt': 'Log Out', 'ic': Icons.logout},
];
