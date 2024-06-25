import 'package:againproject/db/fun.dart';
import 'package:againproject/foodcheckresult.dart';
import 'package:againproject/foodchecksearchresult.dart';
import 'package:againproject/fooddisplay.dart';
import 'package:againproject/foodprice.dart';
import 'package:againproject/ongoingtrips.dart';
import 'package:againproject/splashongoing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class fooditemselected extends StatefulWidget {
  fooditemselected({required this.gold, required this.start});

  String gold = "kp";
  String start;

  @override
  State<fooditemselected> createState() => _fooditemselectedState();
}

class _fooditemselectedState extends State<fooditemselected> {
  DateTime regular = DateTime.now();

  String formattedDate = '';

  String initialvalue = "BREAKFAST";

  DateTime give = DateTime.now();

  final displaydatecontroller = TextEditingController();

  var destinationcontroller = TextEditingController();

  final pricecontroller = TextEditingController();

  final foodtypecontroller = TextEditingController();

  DateTime current = DateTime.now();
  DateTime dd = DateTime.now();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: (() async {
                        Navigator.pop(context);
                      }),
                      icon: Icon(Icons.arrow_back)),
                  backgroundColor: Colors.red,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.gold.toUpperCase(),
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
                            await completefooddetails(widget.gold);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: ((context) {
                              return fooditems();
                            })));
                          }),
                          child: Text("DISPLAY")),
                    ),
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
                            Text(
                              widget.gold,
                              style: TextStyle(color: Colors.white),
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
                                        "FOOD TRACKER",
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "price is required";
                                              }
                                            },
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            controller: pricecontroller,
                                            decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1),
                                              ),
                                              label: Text(
                                                "price",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                color: Colors.red,
                                              )),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red,
                                                      width: 1)),
                                            ),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Food Type",
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
                                                        BorderRadius.circular(
                                                            10),
                                                    value: initialvalue,
                                                    icon: const Icon(
                                                        Icons.arrow_downward),
                                                    items: const [
                                                      DropdownMenuItem(
                                                          value: 'BREAKFAST',
                                                          child: Text(
                                                            "BREAKFAST",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      DropdownMenuItem(
                                                          value: 'LUNCH',
                                                          child: Text(
                                                            "LUNCH",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      DropdownMenuItem(
                                                          value: 'DINNER',
                                                          child: Text(
                                                            "DINNER",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      DropdownMenuItem(
                                                          value: 'OTHERS',
                                                          child: Text(
                                                            "OTHERS",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                    ],
                                                    onChanged: ((newvalue) {
                                                      setState(() {
                                                        if (newvalue != null) {
                                                          initialvalue =
                                                              newvalue;
                                                        } else {
                                                          initialvalue =
                                                              "BREAKFAST";
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
                                            padding: const EdgeInsets.all(18),
                                            child: ElevatedButton(
                                                onPressed: (() async {
                                                  if (formkey.currentState!
                                                      .validate()) {
                                                    String jk =
                                                        DateFormat("dd-MM-yyy")
                                                            .format(current);

                                                    final oi = food(
                                                        Destination:
                                                            widget.gold,
                                                        startingdate: jk,
                                                        foodtype: initialvalue,
                                                        price: pricecontroller
                                                            .text);
                                                    await addfood(oi);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                backgroundColor:
                                                                    Colors.red,
                                                                content: Text(
                                                                  "FOOD EXPENCE ADDED",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )));
                                                  }
                                                }),
                                                child: Text("SUBMIT")),
                                          ),
                                        ),
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
                ))));
  }

  Future home(String name) async {
    final kgf = food(
        Destination: name,
        startingdate: formattedDate,
        foodtype: foodtypecontroller.text,
        price: pricecontroller.text);
  }
}
