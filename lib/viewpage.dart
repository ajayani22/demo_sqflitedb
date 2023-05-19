import 'package:demo_sqflitedb/DBHelper.dart';
import 'package:demo_sqflitedb/formpage.dart';
import 'package:flutter/material.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  @override
  void initState() {
    super.initState();
    getAllData();
  }

  getAllData() async {
    String qry = "select * from contactbook";
    List<Map<String, Object?>> l = await DBHelper.database!.rawQuery(qry);

    String contact = l[0]['contact'].toString();

    print(contact);

    print(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("No Conatct")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return formpage();
            },
          ));
        },
      ),
    );
  }
}
