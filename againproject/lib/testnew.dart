import 'package:againproject/db/fun.dart';
import 'package:againproject/screens/firstpage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Mydate extends StatefulWidget {
  Mydate({super.key});

  @override
  State<Mydate> createState() => _MydateState();
}

class _MydateState extends State<Mydate> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime give = DateTime.now();
  final displaydatecontroller = TextEditingController();
  final displaydateendcontroller = TextEditingController();
  String formattedDate = '';
  String formattedendDate = '';
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    searchdatetriplistnotifier.value.clear();
    // TODO: implement initState
    super.initState();
  }

  String first = "select Starting date";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
              onPressed: (() async {
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.red,
          title: Center(
              child: Image.asset(
            "assets/images/TVLlogo.png",
            height: 100,
          )),
          actions: [],
        ),
        body: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "TRIPS BASED ON DATES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
                      return "required starting date";
                    }
                  },
                  controller: displaydatecontroller,
                  readOnly: true,
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
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025),
                            );
                            if (picked != null) {
                              setState(() {
                                startDate = picked;
                                give = startDate;
                                String formattedDate =
                                    DateFormat("dd-MM-yyy").format(startDate);
                                displaydatecontroller.text = formattedDate;
                              });
                            }
                          }),
                          child: Image.asset(
                            "assets/images/calendar.png",
                            height: 20,
                          )),
                      hintText: displaydatecontroller.text,
                      border: const OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "required ending date";
                    }
                  },
                  controller: displaydateendcontroller,
                  readOnly: true,
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
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: give,
                              firstDate: give,
                              lastDate: DateTime(2025),
                            );
                            if (picked != null) {
                              setState(() {
                                endDate = picked;
                                String formattedendDate =
                                    DateFormat("dd-MM-yyy").format(endDate);

                                displaydateendcontroller.text =
                                    formattedendDate;
                              });
                            }
                          }),
                          child: Image.asset(
                            "assets/images/calendar.png",
                            height: 20,
                          )),
                      hintText: displaydatecontroller.text,
                      border: const OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    checkDatesInRange(startDate, endDate);
                  } else {
                    print("not valid");
                  }
                },
                child: Text('Check Dates in Range'),
              ),
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: searchdatetriplistnotifier,
                      builder: ((context, value, child) {
                        return ListView.separated(
                            itemBuilder: ((context, index) {
                              final data = value[index];
                              DateTime gk = DateTime.parse(data.startdate);
                              String formattedDateString =
                                  DateFormat('dd-MMM-yyy').format(gk);
                              DateTime nk = DateTime.parse(data.enddate);
                              String endformattedDateString =
                                  DateFormat('dd-MMM-yyy').format(nk);
                              return Padding(
                                padding: const EdgeInsets.all(15),
                                child: Card(
                                  color: const Color.fromARGB(255, 37, 35, 35),
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  child: ListTile(
                                    title: Text(
                                      data.destination.toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Starting Date",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              formattedDateString,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Ending Date",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              endformattedDateString,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Travel mode",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data.travelmode,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Estimated Expenses",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data.budget,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Things to Rember",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data.desc,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    leading: Image.asset(
                                      "assets/images/travel.png",
                                      height: 50,
                                    ),
                                  ),
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
