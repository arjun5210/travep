import 'package:againproject/databaseongoing.dart';
import 'package:againproject/date.dart';
import 'package:againproject/datefilter.dart';
import 'package:againproject/db/fun.dart';
import 'package:againproject/displayfavourite.dart';
import 'package:againproject/favorite.dart';
import 'package:againproject/testnew.dart';
import 'package:againproject/update.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class displayup extends StatefulWidget {
  displayup({super.key});

  @override
  State<displayup> createState() => _displayupState();
}

class _displayupState extends State<displayup> {
  @override
  Color gh = Colors.white;
  var oh = Colors.red;
  Color myColor = Colors.yellow;
  void initState() {
    displayupcomingtrips();
    favouritetripdisplay();

    if (upcomingtriplistnotifier.value.isEmpty) {
      setState(() {
        Text(
          "sorryyy",
          style: TextStyle(
            color: Colors.white,
          ),
        );
      });
      print("sorryyy");
    }

    // TODO: implement initState
    super.initState();
  }

  String? selectedButtonIndex;

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
        actions: [
          IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: (() async {
                await displayalert(context);
              }),
              icon: Icon(Icons.delete)),
          IconButton(
              color: Colors.white,
              iconSize: 30,
              onPressed: (() async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return fav();
                })));
              }),
              icon: Icon(Icons.favorite)),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: (() async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return Mydate();
                  })));
                }),
                child: Text("DATE SEARCH")),
          ),
        ],
      ),
      body: upcomingtriplistnotifier.value.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/out.png",
                    height: 150,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "NO UPCOMING TRIPS IS ADDED",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ), // Image to display if list is empty
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                            width: 60,
                          ),
                          const Text(
                            "UPCOMING TRIPS",
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
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: upcomingtriplistnotifier,
                    builder: ((BuildContext, List<upcomingtrip> mp, Widget) {
                      return ListView.separated(
                          itemBuilder: ((context, index) {
                            final data = mp[index];
                            DateTime gk = DateTime.parse(data.startdate);
                            String formattedDateString =
                                DateFormat('dd-MMM-yyy').format(gk);
                            DateTime nk = DateTime.parse(data.enddate);
                            String endformattedDateString =
                                DateFormat('dd-MMM-yyy').format(nk);
                            colourchange(data.destination);
                            var favinst = Hive.openBox<favoritetrip>('favtrip');

                            return Padding(
                              padding: const EdgeInsets.all(30),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.red,
                                    )),
                                width: double.infinity,
                                child: Card(
                                  elevation: 10,
                                  shadowColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: const Color.fromARGB(255, 37, 35, 35),
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
                                              data.destination,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            progress.contains(data.destination)
                                                ? IconButton(
                                                    onPressed: (() {}),
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    ))
                                                : Text(
                                                    " ",
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Starting Date",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Ending Date",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              endformattedDateString,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Estimated Expences",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Rs",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    data.budget,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Things to Remember",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data.desc,
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
                                          children: [
                                            IconButton(
                                                iconSize: 30,
                                                color: Colors.white,
                                                onPressed: (() async {
                                                  showDialog(
                                                    context: context,
                                                    builder: ((context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            Colors.grey,
                                                        title: Text(
                                                            "Are you Sure !!!"),
                                                        actions: [
                                                          ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors.red,
                                                              ),
                                                              onPressed:
                                                                  (() async {
                                                                await deletetrip(
                                                                    data.destination);

                                                                print(
                                                                    " individually deleted");
                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                              child:
                                                                  Text("Yes")),
                                                          ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .indigo),
                                                              onPressed:
                                                                  (() async {
                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                              child: Text("No"))
                                                        ],
                                                      );
                                                    }),
                                                  );
                                                }),
                                                icon: Icon(Icons.delete)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            IconButton(
                                                color: gh,
                                                iconSize: 30,
                                                onPressed: (() async {
                                                  showDialog(
                                                    context: context,
                                                    builder: ((context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            Colors.grey,
                                                        title: Text(
                                                            "Are you want to Add Fvourite !!!"),
                                                        actions: [
                                                          ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors.red,
                                                              ),
                                                              onPressed:
                                                                  (() async {
                                                                selectedButtonIndex =
                                                                    data.destination;
                                                                final kgf = await favoritetrip(
                                                                    destination:
                                                                        data
                                                                            .destination,
                                                                    startdate: data
                                                                        .startdate,
                                                                    budget: data
                                                                        .budget,
                                                                    desc: data
                                                                        .desc,
                                                                    travelmode: data
                                                                        .travelmode,
                                                                    enddate: data
                                                                        .enddate);
                                                                await favouritetripadd(
                                                                    kgf,
                                                                    data.destination,
                                                                    context);

                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                              child:
                                                                  Text("Yes")),
                                                          ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .indigo),
                                                              onPressed:
                                                                  (() async {
                                                                Navigator.pop(
                                                                    context);
                                                              }),
                                                              child: Text("No"))
                                                        ],
                                                      );
                                                    }),
                                                  );
                                                }),
                                                icon: Icon(
                                                  Icons.favorite,
                                                )),
                                            Container(
                                              height: 32,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white)),
                                              child: TextButton(
                                                  onPressed: (() async {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                ((context) {
                                                      return up(
                                                        name: data,
                                                        desc:
                                                            TextEditingController(
                                                                text:
                                                                    data.desc),
                                                        start:
                                                            TextEditingController(
                                                                text: data
                                                                    .startdate),
                                                        end:
                                                            TextEditingController(
                                                                text: data
                                                                    .enddate),
                                                        mode:
                                                            TextEditingController(
                                                          text: data.travelmode,
                                                        ),
                                                        price:
                                                            TextEditingController(
                                                          text: data.budget,
                                                        ),
                                                      );
                                                    })));
                                                  }),
                                                  child: Text(
                                                    "EDIT",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
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
    ));
  }

  Future displayalert(BuildContext context) async {
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
                    await delete();
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

  Future individualdisplayalert(BuildContext context) async {
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
                  await delete();
                  print("deleted");
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

  Future favouritedisplayalert(BuildContext context) async {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Text("Are you Sure want to Add Fvourite !!!"),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: (() async {
                  await delete();
                  print("favourite added");
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
}
