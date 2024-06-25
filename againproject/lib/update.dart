import 'package:againproject/databaseongoing.dart';
import 'package:againproject/db/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class up extends StatefulWidget {
  upcomingtrip name;
  TextEditingController desc;
  TextEditingController start;
  TextEditingController end;
  TextEditingController mode;
  TextEditingController price;

  up(
      {required this.name,
      required this.desc,
      required this.start,
      required this.end,
      required this.mode,
      required this.price});

  @override
  State<up> createState() => _upState();
}

class _upState extends State<up> {
  final namecontroller = TextEditingController();

  DateTime _dateTime = DateTime.now();

  DateTime enddate = DateTime.now();

  DateTime regular = DateTime.now();

  DateTime regularone = DateTime.now();

  DateTime give = DateTime.now();

  final displaydatecontroller = TextEditingController();

  final displaydateendcontroller = TextEditingController();

  final expensecontroller = TextEditingController();

  String formattedDate = '';

  String formattedendDate = '';

  String google = '';

  String yahoo = '';

  DateTime initt = DateTime.now();

  String initialvalue = "bus";

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // String formattedDate = DateFormat('dd/MM/yy').format(_dateTime);
    // String enddateformat = DateFormat('dd/MM/yy').format(enddate);
    // String first =
    //     DateFormat('dd-MM-yyy').format(DateTime.parse(widget.start.text));
    // widget.start.text = first;
    // String second =
    //     DateFormat('dd-MM-yyy').format(DateTime.parse(widget.end.text));
    // widget.end.text = second;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 27, 26, 26),
        appBar: AppBar(
          leading: IconButton(
              onPressed: (() async {
                Navigator.pop(context);
              }),
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Center(
                  child: Text(
                widget.name.destination.toUpperCase(),
                style: TextStyle(
                  fontSize: 30,
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Text("Trip"),
            ],
          ),
          actions: [
            Text(widget.start.text),
          ],
        ),
        body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
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
                                width: 60,
                              ),
                              const Text(
                                "EDIT TRIPS",
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
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Things to remember field is required is requried";
                          }
                        },
                        controller: widget.desc,
                        decoration: InputDecoration(
                          label: Text(
                            "Things to Remember",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: widget.name.desc,
                          hintStyle: TextStyle(
                            color: Colors.blue,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Expense is requried";
                          }
                        },
                        keyboardType: TextInputType.number,
                        controller: widget.price,
                        decoration: InputDecoration(
                          label: Text(
                            "Estimated Expence",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: widget.name.budget,
                          hintStyle: TextStyle(
                            color: Colors.blue,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Starting date is requried";
                          }
                        },
                        controller: widget.start,
                        readOnly: true,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
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
                                    google =
                                        DateFormat('yyy-MM-dd').format(regular);
                                  }
                                  if (regular!.isBefore(regularone)) {
                                    print("yesss");
                                  } else {
                                    print("invalid date given");
                                    widget.end.clear();
                                  }
                                  setState(() {
                                    widget.start.text = google;
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
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ending date is requried";
                          }
                        },
                        controller: widget.end,
                        readOnly: true,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1),
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

                                  final regularone = await showDatePicker(
                                      context: context,
                                      initialDate: give,
                                      firstDate: give,
                                      //DateTime(
                                      // DateTime.now()
                                      //    .year),
                                      lastDate: DateTime(2025));

                                  if (regularone != null) {
                                    formattedendDate = DateFormat('dd-MM-yyyy')
                                        .format(regularone);
                                    yahoo = DateFormat('yyy-MM-dd')
                                        .format(regularone);
                                  }

                                  setState(() {
                                    widget.end.text = yahoo;
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                borderRadius: BorderRadius.circular(10),
                                value: initialvalue,
                                icon: const Icon(Icons.arrow_downward),
                                items: const [
                                  DropdownMenuItem(
                                      value: 'bus',
                                      child: Text(
                                        "Bus",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  DropdownMenuItem(
                                      value: 'train',
                                      child: Text(
                                        "Train",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  DropdownMenuItem(
                                      value: 'Flight',
                                      child: Text(
                                        "Flight",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  DropdownMenuItem(
                                      value: 'own',
                                      child: Text(
                                        "Own vehicle",
                                        style: TextStyle(color: Colors.white),
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
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo),
                        onPressed: (() async {
                          if (formkey.currentState!.validate()) {
                            // await updatetrip(widget.name);
                            await update(
                                widget.name.destination,
                                widget.desc.text,
                                widget.price.text,
                                widget.start.text,
                                widget.end.text,
                                initialvalue.toString());
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      " Trip Updated",
                                      style: TextStyle(color: Colors.white),
                                    )));
                          } else {
                            print("not validate properly");
                          }
                        }),
                        child: Text("SAVE")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
