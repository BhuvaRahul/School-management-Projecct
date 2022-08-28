import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  List<Map> dat = [
    {'sr': '1', 'title': 'Books', 'no': '199826'},
    {'sr': '2', 'title': 'Titles', 'no': '1998'},
    {'sr': '3', 'title': 'National Journals', 'no': '1826'},
    {'sr': '4', 'title': 'Back Volume', 'no': '26'},
    {'sr': '5', 'title': 'E-Journals', 'no': '826'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Table(
        border: TableBorder.all(color: Colors.black,width: 2),
        children: List.generate(
          dat.length,
              (index) {
            return TableRow(
              children: dat[index].values.map((e) {
                return Center(child: Text(e));
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

// class SigninPage extends StatefulWidget {
//   const SigninPage({Key? key}) : super(key: key);
//
//   @override
//   State<SigninPage> createState() => _SigninPageState();
// }
//
// class _SigninPageState extends State<SigninPage> {
//   googleLogin() async{
//     try{
//     }catch (error){
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: MaterialButton(
//               child: Text('Sign Up With Google'),
//               onPressed: signIn,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future signIn() async{
//     await GoogleSignInApi.login();
//   }
// }
//
// class GoogleSignInApi {
//   static final _googleSignIn = GoogleSignIn();
//   static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
// }
