import 'package:global_knowledge_school/common_package.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  List<Map> enter = [
    {'icon':'assets/images/welcome.png', 'txt': 'Guest'},
    {'icon': 'assets/images/stdmain.png', 'txt': 'Student'},
    {'icon': 'assets/images/ftymain.png', 'txt': 'Faculty'},
    {'icon': 'assets/images/collaboration.png', 'txt': 'Admin'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Screens.height(context) * 0.235,
                  width: Screens.width(context) * 1,
                  decoration: const BoxDecoration(
                    color: green300,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(300),
                      bottomRight: Radius.circular(300),
                    ),
                  ),
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(globalKnowledge,
                        style: headingStyle(styleSize: 25)),
                  ),
                ),
                SizedBox(
                  height: Screens.height(context) * .30,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: Screens.height(context) * 0.18,
                      width: Screens.width(context) * 0.33,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: green300, width: 4),
                          image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/school logo.png'))),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(vertical: Screens.height(context) * 0.04),
            Text(
              'Choose Your Option',
              style: headingStyle(),
            ),
            verticalSpace(vertical: Screens.height(context) * 0.04),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 145),
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    elevation: 10,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
                    child: GestureDetector(
                      child: Container(
                        height: Screens.height(context) * 0.15,
                        width: Screens.width(context) * 0.35,
                        decoration: BoxDecoration(
                            color: green300,
                            borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: AssetImage(enter[index]['icon']),fit: BoxFit.cover)
                        ),
                      ),
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GlobalSchool()),
                          );
                        }
                        if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentLogin()),
                          );
                        }
                        if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FacultyLogin()),
                          );
                        }
                        if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminLogin()),
                          );
                        }
                      },
                    ),
                  ),
                  Text(
                    enter[index]['txt'],
                    style: commonStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
