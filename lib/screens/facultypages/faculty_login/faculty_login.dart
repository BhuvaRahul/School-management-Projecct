import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/login_sharedprefrences.dart';

class FacultyLogin extends StatefulWidget {
  const FacultyLogin({Key? key}) : super(key: key);

  @override
  State<FacultyLogin> createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {
  final key1 = GlobalKey<FormState>();
  TextEditingController txtUsernameController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  bool pasword = true;
  String facultyLogin = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    facultyLogin=LogInSharedPrefrence.getFacultyUser.toString();
    facultyLogin=LogInSharedPrefrence.getFacultyPassword.toString();
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
              children: [
                verticalSpace(vertical: Screens.height(context) * 0.03),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: white,
                    backgroundImage:
                        AssetImage('assets/images/school logo.png'),
                  ),
                ),
                Text(facultyLoginTxt, style: headingStyle(styleSize: 30)),
                Text(facultyWelcome, style: headingStyle()),
                Container(
                  height: Screens.height(context) * 0.66,
                  margin: EdgeInsets.only(top: Screens.height(context) * 0.035),
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
                        hintTxt: facultyUsername,
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
                      verticalSpace(vertical: 16),
                      loginTextFormField(
                        controllers: txtPasswordController,
                        obscureText: pasword,
                        hintTxt: facultyPassword,
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
                          icon: Icon(
                            pasword ? icVisibiltyOff : icVisibilty,
                            color: grey,
                          ),
                        ),
                      ),
                      verticalSpace(vertical: Screens.height(context) * 0.06),
                      commonButtons(
                          lable: Text(
                            facultyLog,
                            style: commonStyle(),
                          ),
                          onPress: () {

                            if (key1.currentState!.validate()) {
                              LogInSharedPrefrence.setFacultyUser=txtUsernameController.text;
                              LogInSharedPrefrence.setFacultyPassword=txtPasswordController.text;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FacultyPage()),
                              );
                            }
                          }),
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
