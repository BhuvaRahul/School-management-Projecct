import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/adminpages/admin_main_page/admin_page.dart';
import 'package:global_knowledge_school/login_sharedprefrences.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final key1 = GlobalKey<FormState>();
  TextEditingController txtUsernameController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  bool pasword = true;
  String login = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login = LogInSharedPrefrence.getLoginUser.toString();
    login = LogInSharedPrefrence.getLoginPass.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: green300,
        body: Form(
          key: key1,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(vertical: Screens.height(context) * 0.025),
                const Center(
                  child: CircleAvatar(
                      radius: 50,
                      backgroundColor: white,
                      backgroundImage:
                          AssetImage('assets/images/school logo.png')),
                ),
                Text(loginTxt, style: headingStyle(styleSize: 30)),
                Text(welcomeLogin, style: headingStyle()),
                Container(
                  height: Screens.height(context) * 0.66,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.035),
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      loginTextFormField(
                        controllers: txtUsernameController,
                        obscureText: false,
                        hintTxt: adminUsername,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return facultyEnterUserName;
                          }
                          if (!value.contains(
                            RegExp(r'[a-zA-Z0-9]'),
                          )) {
                            return facultyPleaseEnterValidUserName;
                          }
                          return null;
                        },
                      ),
                      verticalSpace(vertical: Screens.height(context) * 0.02),
                      loginTextFormField(
                        controllers: txtPasswordController,
                        obscureText: pasword,
                        hintTxt: adminPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return facultyPasswordIsRequired;
                          }
                          if (value.length < 6) {
                            return facultyPasswordMustBeAbove6CharactersLong;
                          }
                          if (value.length > 30) {
                            return facultyPasswordMustBeLessThan30Characters;
                          }
                          if (!value.contains(
                            RegExp(r'[a-zA-Z0-9]'),
                          )) {
                            return facultyPasswordMustBeCharacters;
                          }
                          return null;
                        },
                        suffixIc: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                pasword = !pasword;
                              },
                            );
                          },
                          icon: Icon(pasword ? icVisibiltyOff : icVisibilty,
                              color: grey),
                        ),
                      ),
                      verticalSpace(vertical: Screens.height(context) * 0.06),
                      commonButtons(
                        lable: Text(studentLog, style: commonStyle()),
                        onPress: () {
                          LogInSharedPrefrence.setLoginUser =
                              txtUsernameController.text;
                          LogInSharedPrefrence.setLoginPass =
                              txtPasswordController.text;

                          if (key1.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminPage()),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
