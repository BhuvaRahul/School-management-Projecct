import 'package:shared_preferences/shared_preferences.dart';

class LogInSharedPrefrence {
  static SharedPreferences? pref;
  static String logInKey = 'login';
  static String logInKey1 = 'password';
  static String studKeyUser = 'studLoginUser';
  static String studKeyPass = 'studLoginPass';
  static String facultyUser = 'facultyLoginUser';
  static String facultyPass = 'facultyLoginPass';
  static String addFacName = 'addFacName';
  static String addFacSurname = 'addFacSurname';
  static String addFacMobile = 'addFacMobile';
  static String addFacEmail = 'addFacEmail';
  static String addFacSub = 'addFacSub';
  static String addFacUser = 'addFacUser';
  static String addFacPass = 'addFacPass';

  static init() async => pref = await SharedPreferences.getInstance();

  static set setLoginUser(value) => pref!.setString(logInKey, value);

  static String? get getLoginUser => pref!.getString(logInKey);

  static set setLoginPass(value) => pref!.setString(logInKey1, value);

  static String? get getLoginPass => pref!.getString(logInKey1);

  static set setStudLoginUser(value) => pref!.setString(studKeyUser, value);

  static String? get getStudLoginUser => pref!.getString(studKeyUser);

  static set setStudLoginPass(value) => pref!.setString(studKeyPass, value);

  static String? get getStudLoginPass => pref!.getString(studKeyPass);

  static set setFacultyUser(value) => pref!.setString(facultyUser, value);

  static String? get getFacultyUser => pref!.getString(facultyUser);

  static set setFacultyPassword(value) => pref!.setString(facultyPass, value);

  static String? get getFacultyPassword => pref!.getString(facultyPass);

  static set setAddFacName(value) => pref!.setString(addFacName, value);

  static String? get getAddFacName => pref!.getString(addFacName);

  static set setAddFacSurname(value) => pref!.setString(addFacSurname, value);

  static String? get getAddFacSurname => pref!.getString(addFacSurname);

  static set setAddFacMobile(value) => pref!.setString(addFacMobile, value);

  static String? get getAddFacMobile => pref!.getString(addFacMobile);

  static set setAddFacEmail(value) => pref!.setString(addFacEmail, value);

  static String? get getAddFacEmail => pref!.getString(addFacEmail);

  static set setAddFacSub(value) => pref!.setString(addFacSub, value);

  static String? get getAddFacSub => pref!.getString(addFacSub);

  static set setAddFacUser(value) => pref!.setString(addFacUser, value);

  static String? get getAddFacUser => pref!.getString(addFacUser);

  static set setAddFacPass(value) => pref!.setString(addFacPass, value);

  static String? get getAddFacPass => pref!.getString(addFacPass);
}
