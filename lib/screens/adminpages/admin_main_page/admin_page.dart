import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/login_sharedprefrences.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_page_data/add_student_detail/add_student/add_student_details.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green300,
        leading: commonAppContainer(),
        title: AutoSizeText('Admin', style: headingStyle()),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: white,
                backgroundImage: AssetImage('assets/images/school logo.png'),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: adminDrawer.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(adminDrawer[index]['icon']),
                title: Text(adminDrawer[index]['fees'], style: commonStyle()),
                onTap: () {
                  if (index == 0) {}
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HostelApplyDetails(),
                      ),
                    );
                  }
                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdmissionApplyDetails(),
                      ),
                    );
                  }
                  if (index == 3) {
                    LogInSharedPrefrence.setLoginUser = '';
                    LogInSharedPrefrence.setLoginPass = '';
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EnterPage()));
                  }
                },
              ),
              separatorBuilder: (context, index) => const Divider(thickness: 1),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.33,
          ),
          itemCount: admin.length,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              verticalSpace(vertical: Screens.height(context) * 0.02),
              GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Subject()));
                  }
                  if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Standard()));
                  }
                  if (index == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TimeTablePage()));
                  }
                  if (index == 3) {}
                  if (index == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HostelApplyDetails()));
                  }
                  if (index == 5) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AdmissionApplyDetails()));
                  }
                  if (index == 6) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Calendar()));
                  }
                  if (index == 7) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FestivalImages()));
                  }
                  if (index == 8) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCurrentNews(),
                      ),
                    );
                  }
                },
                child: Card(
                  elevation: 10,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                  child: Container(
                    height: 90,
                    width: Screens.width(context) * 0.4,
                    decoration: BoxDecoration(
                      color: green300,
                      borderRadius: BorderRadius.circular(20),
                      image:  DecorationImage(
                        image: AssetImage(admin[index]['image']),fit: BoxFit.cover
                      ),
                    ),
                    // child:

                    // Icon(
                    //   admin[index]['icn'],
                    //   size: 50,
                    // ),
                  ),
                ),
              ),
              AutoSizeText(admin[index]['tlt'], style: commonStyle()),
            ],
          ),
        ),
      ),
    );
  }
}

List adminDrawer = [
  {'fees': 'Fees', 'icon': Icons.money},
  {'fees': 'Hostel', 'icon': Icons.home_work_outlined},
  {'fees': 'Admission', 'icon': Icons.access_time},
  {'fees': 'LogOut', 'icon': Icons.logout},
];

List<Map> admin = [
  {'tlt': 'Faculty Details', 'icn': Icons.person,'image':'assets/images/happystf.png'},
  {'tlt': 'Student Details', 'icn': Icons.group,'image':'assets/images/sch9.png'},
  {'tlt': 'Time Table', 'icn': Icons.table_chart_outlined,'image':'assets/images/timetbl.png'},
  {'tlt': 'Fees', 'icn': Icons.money,'image':'assets/images/fee.png'},
  {'tlt': 'Hostel', 'icn': Icons.home_work_outlined,'image':'assets/images/hostl.png'},
  {'tlt': 'Admission', 'icn': Icons.person,'image':'assets/images/admission.png'},
  {'tlt': 'Activity calendar', 'icn': Icons.calendar_today_rounded,'image':'assets/images/activity calander.png'},
  {'tlt': 'Festival Images', 'icn': Icons.image_sharp,'image':'assets/images/festivl.png'},
  {'tlt': 'Current News', 'icn': Icons.newspaper_outlined,'image':'assets/images/notice.png'}
];
