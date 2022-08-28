import 'package:flutter/material.dart';


class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 100,
            width: 400,
            color: Colors.yellow,
            child: const Center(child: Text('Hello Flutter How are you ??')),
          ),
        ),
      ),
    );
  }
}
