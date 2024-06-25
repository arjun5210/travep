// ignore_for_file: avoid_types_as_parameter_names

import 'package:againproject/db/fun.dart';
import 'package:againproject/db/sample.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class first extends StatefulWidget {
  first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  final namecontroller = TextEditingController();

  final datecontroller = TextEditingController();
  final displaydatecontroller = TextEditingController();

  DateTime dt = DateTime.now();
  DateTime? orignal;

  String result = "date";
  DateTime picked = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  String lastdate = "jkjkjk";
  var formatedtext;
  final formkey = GlobalKey<FormState>();
  String formattedDate = '';
  String formattedendDate = '';
  final displaydateendcontroller = TextEditingController();
  DateTime give = DateTime.now();
  DateTime regular = DateTime.now();
  DateTime regularone = DateTime.now();

  @override
  Widget build(BuildContext context) {
    getdata();
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: datecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                controller: displaydatecontroller,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    label: const Text(
                      "Starting date",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    suffixIcon: TextButton(
                        onPressed: (() async {
                          final regular = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025));

                          if (regular != null) {
                            formattedDate =
                                DateFormat('dd-MM-yyy').format(regular);
                            give = regular;
                          }
                          setState(() {
                            displaydatecontroller.text = formattedDate;
                          });
                        }),
                        child: Image.asset(
                          "assets/images/calendar.png",
                          height: 20,
                        )),
                    hintText: displaydatecontroller.text,
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                controller: displaydateendcontroller,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    label: const Text(
                      "Ending date",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    suffixIcon: TextButton(
                        onPressed: (() async {
                          final regularone = await showDatePicker(
                              context: context,
                              initialDate: give,
                              firstDate: give,
                              //DateTime(
                              // DateTime.now()
                              //    .year),
                              lastDate: DateTime(2025));

                          if (regularone != null) {
                            formattedendDate =
                                DateFormat('dd-MM-yyy').format(regularone);
                          }
                          setState(() {
                            displaydateendcontroller.text = formattedendDate;
                          });
                        }),
                        child: Image.asset(
                          "assets/images/calendar.png",
                          height: 20,
                        )),
                    hintText: displaydateendcontroller.text,
                    border: const OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: (() async {
                  if (formkey.currentState!.validate()) {
                    await valuesadd();
                  } else {
                    print("soryyy");
                  }
                }),
                child: const Text("submit")),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: maketriplistnotifier,
                builder: ((BuildContext, List<maketrip> mp, Widget) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        final data = mp[index];

                        return ListTile(
                          title: Text(data.name),
                          subtitle: Row(
                            children: [],
                          ),
                        );
                      }),
                      separatorBuilder: ((context, index) {
                        return Divider();
                      }),
                      itemCount: mp.length);
                }),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future valuesadd() async {
    final gh = await maketrip(
      name: namecontroller.text,
      date: datecontroller.text,
      displaydate: orignal.toString(),
    );
    add(gh);
    print(dt.toString());
    print("sucessfully reg");
  }

  Future adddate(BuildContext context) async {
    final dt = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    final result = _selectedDate.toString();
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    setState(() {});
  }
}
