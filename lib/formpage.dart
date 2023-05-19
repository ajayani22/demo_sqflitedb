import 'package:demo_sqflitedb/DBHelper.dart';
import 'package:demo_sqflitedb/viewpage.dart';
import 'package:flutter/material.dart';

class formpage extends StatefulWidget {
  const formpage({Key? key}) : super(key: key);

  @override
  State<formpage> createState() => _formpageState();
}

class _formpageState extends State<formpage> {
  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();

  bool namestatus = false;

  String? contacterror;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Contact"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: namestatus ? "Please fill the name" : null),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: tcontact,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), errorText: contacterror),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                String name = tname.text;
                String contact = tcontact.text;

                if (name.isEmpty) {
                  namestatus = true;
                  setState(() {});
                } else if (contact.isEmpty) {
                  contacterror = "Please enter contact";
                  setState(() {});
                } else if (contact.length < 10) {
                  contacterror = "Please enter valid contact";
                  setState(() {});
                } else {
                  String qry =
                      "insert into contactbook (name, contact)  values('$name','$contact')";

                  int a = await DBHelper.database!.rawInsert(qry);
                  print(a);
                  if (a > 0) {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return viewpage();
                      },
                    ));
                  } else {
                    print("try again");
                  }
                }
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
