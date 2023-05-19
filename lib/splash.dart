import 'package:demo_sqflitedb/DBHelper.dart';
import 'package:demo_sqflitedb/viewpage.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    gonext();
  }

  gonext() {
    DBHelper.createMyDB().then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return viewpage();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
