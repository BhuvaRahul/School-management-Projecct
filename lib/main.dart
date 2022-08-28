import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_knowledge_school/common_package.dart';
import 'package:global_knowledge_school/screens/splashscreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await LogInSharedPrefrence.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplahScreen(),
    );
  }
}
