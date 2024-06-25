import 'dart:ui';

import 'package:againproject/completedetailstrip.dart';
import 'package:againproject/completestaytipdetails.dart';
import 'package:againproject/completetraveldetailstrip.dart';
import 'package:againproject/db/fun.dart';
import 'package:againproject/ongoingtrips.dart';
import 'package:againproject/totaldisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class aboutapp extends StatefulWidget {
  const aboutapp({super.key});

  @override
  State<aboutapp> createState() => _aboutappState();
}

class _aboutappState extends State<aboutapp> {
  @override
  void initState() {
    displayongoingtrip();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [],
        backgroundColor: Colors.red,
        title: Center(child: Text("ABOUT")),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "TRAVEP",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "The application is designed to help users track their expenses during journeys, providing a comprehensive solution for managing trip-related costs. Users can easily log and monitor various types of expenses such as food, travel, and accommodation. The application allows users to plan upcoming trips by selecting specific dates, ensuring they have a well-organized itinerary.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Upon completing a trip, users can access detailed expense reports that show the total amount spent in each category. This feature enables users to see a breakdown of their spending on food, travel, and accommodation, helping them understand their financial outlay for the trip. Additionally, the application offers a date-wise expense view, allowing users to analyze their spending patterns over time.",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 26, 26, 26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future alertdelete() async {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Text("Are you Sure !!!"),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: (() async {
                  await deleteongoing();
                  await displayongoingtrip();
                  print("deleed");
                  Navigator.pop(context);
                }),
                child: Text("Yes")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: (() async {
                  Navigator.pop(context);
                }),
                child: Text("No"))
          ],
        );
      }),
    );
  }

  Future displayalert(BuildContext context, data) async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            title: Text("Are you Sure !!!"),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: (() async {
                    await deletetripindividualy(data.Destination);
                    print("deleted");
                    Navigator.pop(context);
                  }),
                  child: Text("Yes")),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  onPressed: (() async {
                    Navigator.pop(context);
                  }),
                  child: Text("No"))
            ],
          );
        }));
  }
}
