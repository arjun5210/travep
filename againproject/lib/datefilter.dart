import 'package:againproject/db/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class datefilter extends StatefulWidget {
  datefilter({super.key});

  @override
  State<datefilter> createState() => _datefilterState();
}

class _datefilterState extends State<datefilter> {
  DateTime regular = DateTime.now();
  DateTime regularone = DateTime.now();
  final displaydatecontroller = TextEditingController();
  final displaydateendcontroller = TextEditingController();
  String formattedDate = '';
  String formattedendDate = '';
  DateTime give = DateTime.now();
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    searchdatetriplistnotifier.value.clear();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
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
                    color: Colors.black,
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
                      checkDatesInRange(regular, regular);
                    } else {
                      print("notvalid");
                    }
                  }),
                  child: Text("check")),
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: searchdatetriplistnotifier,
                      builder: ((context, value, child) {
                        return ListView.separated(
                            itemBuilder: ((context, index) {
                              final data = value[index];
                              return ListTile(
                                title: Text(data.destination),
                                subtitle: Column(
                                  children: [
                                    Text(data.startdate),
                                    Text(data.enddate),
                                  ],
                                ),
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return Divider();
                            }),
                            itemCount: value.length);
                      })))
            ],
          ),
        ),
      ),
    );
  }
}
