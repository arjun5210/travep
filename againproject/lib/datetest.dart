import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class datet extends StatefulWidget {
  datet({super.key});

  @override
  State<datet> createState() => _datetState();
}

class _datetState extends State<datet> {
  final datecontroller = TextEditingController();

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text(_dateTime.toString()),
          ElevatedButton(
              onPressed: (() async {
                await datedisplay(context);
              }),
              child: Text("sumit")),
          InkWell(
            onTap: () {
              datedisplay(context);
            },
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("startdate"),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Future datedisplay(BuildContext context) async {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }
}
