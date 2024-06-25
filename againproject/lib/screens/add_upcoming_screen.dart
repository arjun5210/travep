import 'package:againproject/databaseongoing.dart';
import 'package:againproject/db/fun.dart';

import 'package:againproject/screens/searchtrip_display_screen.dart';
import 'package:againproject/screens/upcoming_display_screen.dart';
import 'package:againproject/selectimage.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class upcome extends StatefulWidget {
  upcome({super.key});

  @override
  State<upcome> createState() => _upcomeState();
}

class _upcomeState extends State<upcome> {
  final destinationcontroller = TextEditingController();

  final startdatecontroller = TextEditingController();

  final desccontroller = TextEditingController();

  final expensecontroller = TextEditingController();
  DateTime _dateTime = DateTime.now();
  DateTime enddate = DateTime.now();
  var one;
  var two;
  DateTime selectone = DateTime.now();
  DateTime selecttwo = DateTime.now();
  DateTime picked = DateTime.now();
  DateTime p = DateTime.now();
  DateTime initt = DateTime.now();
  DateTime regular = DateTime.now();
  DateTime regularone = DateTime.now();

  DateTime give = DateTime.now();
  String got = "lklkk";

  var dateStringone;
  var dateStringtwo;
  DateTime? _selectedDate;
  String initialvalue = "bus";
  final displaydatecontroller = TextEditingController();
  final displaydateendcontroller = TextEditingController();

  var formatedtext;

  final formkey = GlobalKey<FormState>();
  String formattedDate = '';
  String formattedendDate = '';
  String google = '';
  String yahoo = '';

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yy').format(_dateTime);
    String enddateformat = DateFormat('dd/MM/yy').format(enddate);

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: const Icon(Icons.arrow_back)),
              backgroundColor: Colors.red,
              title: Center(
                  child: Image.asset(
                "assets/images/TVLlogo.png",
                height: 100,
              )),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: Card(
                    color: Colors.indigo,
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: TextButton(
                        onPressed: (() async {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: ((context) {
                            return displayup();
                          })));
                        }),
                        child: const Text(
                          "VIEW TRIPS",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: Container(
                      child: Card(
                    color: Colors.indigo,
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: IconButton(
                        onPressed: (() {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: ((context) {
                            return ongoingsearch();
                          })));
                        }),
                        icon: const Icon(
                          Icons.search,
                          size: 25,
                        )),
                  )),
                ),
              ],
            ),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 37, 35, 35),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.asset(
                                      "assets/images/travel.png",
                                      height: 80,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  const Text(
                                    "ADD UPCOMING TRIPS",
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            width: double.infinity,
                            height: 760,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 37, 35, 35),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Destion is requried";
                                        }
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      controller: destinationcontroller,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1),
                                        ),
                                        label: Text(
                                          "Destination",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color: Colors.red,
                                        )),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Expense is requried";
                                        }
                                      },
                                      style:
                                          const TextStyle(color: Colors.white),
                                      controller: expensecontroller,
                                      decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1),
                                        ),
                                        label: Text(
                                          "Estimated Expence",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.red, width: 1)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: SizedBox(
                                      height: 80,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Thing to remember is requried";
                                          }
                                        },
                                        style: const TextStyle(
                                            color: Colors.white),
                                        controller: desccontroller,
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          label: Text(
                                            "Thing to Remember",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red, width: 1)),
                                        ),
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
                                          return "Starting date is requried";
                                        }
                                      },
                                      controller: displaydatecontroller,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          label: const Text(
                                            "Starting date",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          suffixIcon: TextButton(
                                              onPressed: (() async {
                                                final regular =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime(2025));

                                                if (regular != null) {
                                                  formattedDate =
                                                      DateFormat('dd-MM-yyy')
                                                          .format(regular);
                                                  give = regular;
                                                  google =
                                                      DateFormat('yyy-MM-dd')
                                                          .format(regular);
                                                }
                                                if (regular!
                                                    .isBefore(regularone)) {
                                                  print("yesss");
                                                } else {
                                                  print("invalid date given");
                                                  displaydateendcontroller
                                                      .clear();
                                                }
                                                setState(() {
                                                  displaydatecontroller.text =
                                                      formattedDate;
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
                                          return "Ending date is requried";
                                        }
                                      },
                                      controller: displaydateendcontroller,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          label: const Text(
                                            "Ending date",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          suffixIcon: TextButton(
                                              onPressed: (() async {
                                                await regular != null
                                                    ? initt = regular
                                                    : print("soryyyyy");

                                                final regularone =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate: give,
                                                        firstDate: give,
                                                        //DateTime(
                                                        // DateTime.now()
                                                        //    .year),
                                                        lastDate:
                                                            DateTime(2025));

                                                if (regularone != null) {
                                                  formattedendDate =
                                                      DateFormat('dd-MM-yyy')
                                                          .format(regularone);
                                                  yahoo =
                                                      DateFormat('yyy-MM-dd')
                                                          .format(regularone);
                                                }

                                                setState(() {
                                                  displaydateendcontroller
                                                      .text = formattedendDate;
                                                });
                                              }),
                                              child: Image.asset(
                                                "assets/images/calendar.png",
                                                height: 20,
                                              )),
                                          hintText:
                                              displaydateendcontroller.text,
                                          border: const OutlineInputBorder()),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Travel Mode",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 50,
                                          ),
                                          DropdownButton(
                                              underline: SizedBox(),
                                              dropdownColor: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              value: initialvalue,
                                              icon: const Icon(
                                                  Icons.arrow_downward),
                                              items: const [
                                                DropdownMenuItem(
                                                    value: 'bus',
                                                    child: Text(
                                                      "Bus",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                DropdownMenuItem(
                                                    value: 'train',
                                                    child: Text(
                                                      "Train",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                DropdownMenuItem(
                                                    value: 'Flight',
                                                    child: Text(
                                                      "Flight",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                DropdownMenuItem(
                                                    value: 'own',
                                                    child: Text(
                                                      "Own vehicle",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                              ],
                                              onChanged: ((newvalue) {
                                                setState(() {
                                                  if (newvalue != null) {
                                                    initialvalue = newvalue;
                                                  } else {
                                                    initialvalue = "bus";
                                                  }
                                                });
                                              })),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.indigo,
                                          ),
                                          onPressed: (() async {
                                            if (formkey.currentState!
                                                .validate()) {
                                              await upcomingtripadd();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                        "Upcoming Trip Added",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )));
                                              clearpage();
                                            }

                                            // ignore: use_build_context_synchronously
                                          }),
                                          child: const Text("SUBMIT")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }

  Future upcomingtripadd() async {
    DateTime test = await DateTime.parse(google);
    DateTime testone = await DateTime.parse(yahoo);

    final aj = upcomingtrip(
      destination: destinationcontroller.text,
      startdate: google,
      budget: expensecontroller.text,
      desc: desccontroller.text,
      enddate: yahoo,
      travelmode: initialvalue.toString(),
    );

    await addtrip(aj);
  }

  Future startdatedisplay(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectone) {
      setState(() {
        selectone = picked;
      });

      String dateStringone = await selectone.toString();

      // Convert date to string and store in Hive

    }
  }

  Future displayalert() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text("INVALID TRIP"),
            actions: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: Text("OK"))
            ],
          );
        }));
  }

  void clearpage() {
    destinationcontroller.clear();
    desccontroller.clear();
    displaydatecontroller.clear();
    displaydateendcontroller.clear();
    expensecontroller.clear();
  }
}
