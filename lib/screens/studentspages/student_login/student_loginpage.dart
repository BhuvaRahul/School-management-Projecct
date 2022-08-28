import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/login_sharedprefrences.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final key1 = GlobalKey<FormState>();
  TextEditingController txtUsernameController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  bool pasword = true;
  String studLogin='';
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    studLogin=LogInSharedPrefrence.getStudLoginUser.toString();
    studLogin=LogInSharedPrefrence.getStudLoginPass.toString();
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
                Text(studentLoginTxt, style: headingStyle(styleSize: 30)),
                Text(studentWelcome, style: headingStyle()),
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
                        hintTxt: studentUsername,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return studentEnterUserName;
                          }
                          if (!value.contains(
                            RegExp(r'[a-zA-Z0-9]'),
                          )) {
                            return studentEnterValidUserName;
                          }
                          return null;
                        },
                      ),
                      verticalSpace(vertical: Screens.height(context) * 0.02),
                      loginTextFormField(
                        controllers: txtPasswordController,
                        obscureText: pasword,
                        hintTxt: studentPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return studentPasswordRequired;
                          }
                          if (value.length < 6) {
                            return studentPasswordAboveChar;
                          }
                          if (value.length > 30) {
                            return studentPasswordLessChar;
                          }
                          if (!value.contains(
                            RegExp(r'[a-zA-Z0-9]'),
                          )) {
                            return studentPasswordChar;
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
                          if (key1.currentState!.validate()) {
                            LogInSharedPrefrence.setStudLoginUser=txtUsernameController.text;
                            LogInSharedPrefrence.setStudLoginPass=txtPasswordController.text;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StudentPage()),
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
