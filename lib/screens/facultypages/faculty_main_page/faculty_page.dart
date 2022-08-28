import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/login_sharedprefrences.dart';

class FacultyPage extends StatefulWidget {
  const FacultyPage({Key? key}) : super(key: key);

  @override
  State<FacultyPage> createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green300,
        centerTitle: true,
        leading: commonAppContainer(),
        title: const Text(
          faculty,
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration:  const BoxDecoration(color: green300),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: black,
                        child: CircleAvatar(
                         radius: 38,
                         backgroundColor: white,
                          backgroundImage:
                          AssetImage('assets/images/school logo.png',),
                        ),
                      ),
                    ),
                    ExpansionTile(
                      title: Text('Rahul Bhuva', style: commonStyle()),
                      subtitle: Text('+91 7046382807', style: commonStyle()),
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            height: Screens.height(context) * 0.095,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            color: white,
                            child: Row(
                              children: [
                                horizontalSpace(
                                    horizontal: Screens.width(context) * 0.03),
                                const CircleAvatar(
                                  backgroundColor: white,
                                  backgroundImage: AssetImage(
                                      'assets/images/school logo.png'),
                                ),
                                // horizontalSpace(
                                //     horizontal: Screens.width(context) * 0.065),
                                Text('     Profile',
                                    style: commonStyle()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ListView.separated(
                itemCount: drawerLs.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(drawerLs[index]['ic'], color: black),
                  title: Text(
                    drawerLs[index]['text'],
                    style: commonStyle(),
                  ),
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentDetails(
                              sIndex: index,
                            ),
                          ));
                    }
                    if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FacultyDetails(),
                          ));
                    }
                    if (index == 2) {
                      LogInSharedPrefrence.setFacultyUser = '';
                      LogInSharedPrefrence.setFacultyPassword = '';
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EnterPage()));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: facultyLs.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.33,
          ),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Column(
            children: [
              verticalSpace(vertical: Screens.height(context) * 0.02),
              GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HDetails(i: index)));
                  }
                  if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FacultyTimeTables(),
                        ));
                  }
                  if (index == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentLeave()));
                  }
                  if (index == 4) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetails(
                            sIndex: index,
                          ),
                        ));
                  }
                  if (index == 5) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FacultyDetails(),
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
                    width: Screens.width(context) * 0.43,
                    decoration: BoxDecoration(
                      color: green300,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(facultyLs[index]['img']),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Text(facultyLs[index]['txt'], style: commonStyle()),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> facultyLs = [
  {'txt': 'Home Work', 'img': 'assets/images/homework.png'},
  {'txt': 'Time Table', 'img': 'assets/images/timetbl.png'},
  {'txt': 'Student Leave', 'img': 'assets/images/leave.png'},
  {'txt': 'Attendances', 'img': 'assets/images/attandance.png'},
  {'txt': 'Student Details', 'img': 'assets/images/sch9.png'},
  {'txt': 'Faculty Details', 'img': 'assets/images/happystf.png'},
];

List drawerLs = [
  {'text': 'Student Details', 'ic': Icons.group},
  {'text': 'Faculty Details', 'ic': Icons.person},
  {'text': 'Log Out', 'ic': Icons.logout},
];
