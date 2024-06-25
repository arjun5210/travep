import 'package:againproject/completedtrip.dart';
import 'package:againproject/databaseongoing.dart';
import 'package:againproject/db/fun.dart';
import 'package:againproject/favorite.dart';
import 'package:againproject/foodselect.dart';
import 'package:againproject/hopescreen.dart';
import 'package:againproject/imediatelygoing.dart';
import 'package:againproject/main.dart';
import 'package:againproject/screens/allselecting_screen.dart';
import 'package:againproject/screens/homepage_screen.dart';
import 'package:againproject/splashongoing.dart';
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

class ongoings extends StatefulWidget {
  ongoings({super.key});

  @override
  State<ongoings> createState() => _ongoingsState();
}

class _ongoingsState extends State<ongoings> {
  String formattedDate = '';

  final destinationcontroller = TextEditingController();
  @override
  void initState() {
    final day = DateTime.now();
    String curent = DateFormat('yyy-MM-dd').format(day);
    datedisplayupcomingtrips(curent);
    print(curent);
    dateupcomingdisplaylistnotifier.value.clear();

    // TODO: implement initState
    super.initState();
  }

  String _stringValue = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: (() {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: ((context) {
                      return testpage();
                    })), (route) => false);
                  }),
                  icon: Icon(Icons.arrow_back)),
              backgroundColor: Colors.red,
              title: Center(
                  child: Image.asset(
                "assets/images/TVLlogo.png",
                height: 100,
              )),
              actions: [],
            ),
            body: Padding(
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
                                  "START YOUR JOURNEY",
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
                                  Text(descc[0],
                                      style: TextStyle(color: Colors.white)),
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: destinationcontroller,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: ElevatedButton(
                                          onPressed: (() async {
                                            descc.add(
                                                destinationcontroller.text);
                                            print(descc);

                                            final ui = DateTime.now();

                                            String formattedDate =
                                                DateFormat('dd-MM-yyy')
                                                    .format(ui);
                                            desctwo.add(formattedDate);
                                            final km = imeongoing(
                                                Destination:
                                                    destinationcontroller.text,
                                                startingdate: formattedDate,
                                                endingdate: "default");
                                            await addongoing(km);
                                            final nock = await SharedPreferences
                                                .getInstance();
                                            nock.setBool(savekey, true);
                                            await _saveStringValue(
                                                destinationcontroller.text);
                                            await _loadStringValue();

                                            // await splash(
                                            //   data:
                                            //       destinationcontroller.text);

                                            //  Navigator.of(context)
                                            //      .pushReplacement(
                                            //          MaterialPageRoute(
                                            //              builder: ((context) {
                                            //    return fooditemselected(
                                            //      gold:
                                            //         destinationcontroller.text,
                                            //      start: formattedDate,
                                            //    );
                                            //  })));
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) {
                                                return selectpagetwo(
                                                  destinationname:
                                                      destinationcontroller
                                                          .text,
                                                  stdate: formattedDate,
                                                );
                                              },
                                            ));
                                          }),
                                          child: Text("SUBMIT")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                          valueListenable: dateupcomingdisplaylistnotifier,
                          builder:
                              ((BuildContext, List<upcomingtrip> mp, Widget) {
                            return ListView.separated(
                                itemBuilder: ((context, index) {
                                  final data = mp[index];
                                  DateTime gk = DateTime.parse(data.startdate);
                                  String formattedDateString =
                                      DateFormat('dd-MMM-yyy').format(gk);
                                  DateTime nk = DateTime.parse(data.enddate);
                                  String endformattedDateString =
                                      DateFormat('dd-MMM-yyy').format(nk);

                                  return Padding(
                                    padding: const EdgeInsets.all(30),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.red,
                                          )),
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 10,
                                        shadowColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 37, 35, 35),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/travellog.png",
                                                    height: 50,
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    data.destination
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "You are Planned for This trip in Upcoming Trips",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Starting Date",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    formattedDateString,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
