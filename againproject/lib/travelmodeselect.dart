import 'package:againproject/completedtrip.dart';
import 'package:againproject/db/fun.dart';
import 'package:againproject/foodselect.dart';
import 'package:againproject/hopescreen.dart';
import 'package:againproject/imediatelygoing.dart';
import 'package:againproject/main.dart';
import 'package:againproject/screens/allselecting_screen.dart';
import 'package:againproject/splashongoing.dart';
import 'package:againproject/travelexpdisplay.dart';
import 'package:againproject/travelprice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:againproject/ongoingtestdisplay';
import 'package:againproject/screens/add_upcoming_screen.dart';
import 'package:againproject/selectingpage.dart';
import 'package:againproject/update.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class travelselect extends StatefulWidget {
  travelselect(
      {super.key, required this.destinationname, required this.startdate});
  String destinationname;
  String startdate;

  @override
  State<travelselect> createState() => _travelselectState();
}

class _travelselectState extends State<travelselect> {
  String formattedDate = '';

  String initialvalue = "bus";

  final destinationcontroller = TextEditingController();

  final expensecontroller = TextEditingController();

  @override
  void initState() {
    print(descc.first);
    print(desctwo.first);
    // TODO: implement initState
    super.initState();
  }

  String _stringValue = '';
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(Icons.arrow_back)),
              backgroundColor: Colors.red,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.destinationname.toUpperCase(),
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Trip",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Center(
                      child: Image.asset(
                    "assets/images/TVLlogo.png",
                    height: 100,
                  )),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: (() async {
                        await completetraveldetails(widget.destinationname);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: ((context) {
                          return travelitems();
                        })));
                      }),
                      child: Text("DISPLAY")),
                )
              ],
            ),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 37, 35, 35),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      "assets/images/destination.png",
                                      height: 70,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  const Text(
                                    "SELECT TRAVEL MODE",
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 37, 35, 35),
                            ),
                            child: Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
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
                                                            color:
                                                                Colors.white),
                                                      )),
                                                  DropdownMenuItem(
                                                      value: 'train',
                                                      child: Text(
                                                        "Train",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                  DropdownMenuItem(
                                                      value: 'Flight',
                                                      child: Text(
                                                        "Flight",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )),
                                                  DropdownMenuItem(
                                                      value: 'own',
                                                      child: Text(
                                                        "Own vehicle",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Expense is requried";
                                          }
                                        },
                                        style: const TextStyle(
                                            color: Colors.white),
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
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18),
                                        child: ElevatedButton(
                                            onPressed: (() async {
                                              if (formkey.currentState!
                                                  .validate()) {
                                                final kgf = travelexp(
                                                    Destination:
                                                        widget.destinationname,
                                                    startingdate:
                                                        widget.startdate,
                                                    price:
                                                        expensecontroller.text,
                                                    mode: initialvalue);
                                                await addtravelexp(kgf);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                            backgroundColor:
                                                                Colors.red,
                                                            content: Text(
                                                              "TRAVEL EXPENCE ADDED",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )));
                                              }
                                            }),
                                            child: Text("SUBMIT")),
                                      ),
                                    )
                                  ],
                                ),
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

  _loadStringValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _stringValue = prefs.getString('myStringKey') ?? '';
      lorry = _stringValue;
    });
  }

  _saveStringValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myStringKey', value);
  }
}
