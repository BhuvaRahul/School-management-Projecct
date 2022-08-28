import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_main_page/admin_page.dart';
import 'package:global_knowledge_school/login_sharedprefrences.dart';

class SplahScreen extends StatefulWidget {
  const SplahScreen({Key? key}) : super(key: key);

  @override
  State<SplahScreen> createState() => _SplahScreenState();
}

class _SplahScreenState extends State<SplahScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomePage();
  }

  void navigateToHomePage() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LogInSharedPrefrence.init();
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        if (LogInSharedPrefrence.getStudLoginUser != '' &&
            LogInSharedPrefrence.getStudLoginUser != null &&
            LogInSharedPrefrence.getStudLoginPass != '' &&
            LogInSharedPrefrence.getStudLoginPass != null) {
          return const StudentPage();
        } else if (LogInSharedPrefrence.getLoginUser != '' &&
            LogInSharedPrefrence.getLoginUser != null &&
            LogInSharedPrefrence.getLoginPass != '' &&
            LogInSharedPrefrence.getLoginPass != null) {
          return const AdminPage();
        } else if (LogInSharedPrefrence.getFacultyUser != '' &&
            LogInSharedPrefrence.getFacultyUser != null &&
            LogInSharedPrefrence.getFacultyPassword != '' &&
            LogInSharedPrefrence.getFacultyPassword != null) {
          return const FacultyPage();
        } else {
          return const EnterPage();
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Screens.height(context) * 0.13,
                  width: Screens.width(context) * 0.3,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 14,
                          color: Colors.grey,
                        )
                      ],
                      color: green300,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        // bottomLeft: Radius.circular(100),
                      )),
                ),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/hand1.png'),
                ),
                Container(
                  height: Screens.height(context) * 0.13,
                  width: Screens.width(context) * 0.3,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 14, color: Colors.grey)
                      ],
                      color: green300,
                      borderRadius: BorderRadius.only(
                        // bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(101),
                      )),
                )
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/images/school logo.png'),
                    backgroundColor: white,
                  ),
                  Text(
                    global,
                    style: headingStyle(),
                  ),
                  Text(high, style: commonStyle(fontWeights: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: Screens.height(context) * 0.31,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                  )
                ],
                color: green300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(300),
                  topRight: Radius.circular(300),
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/schhh.png'),
                    fit: BoxFit.fill),
              ),
            )
          ],
        ),
      ),
    );
  }
}
