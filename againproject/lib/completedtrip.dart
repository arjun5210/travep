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

class complete extends StatefulWidget {
  const complete({super.key});

  @override
  State<complete> createState() => _completeState();
}

class _completeState extends State<complete> {
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
        actions: [
          IconButton(
              onPressed: (() async {
                await alertdelete();
              }),
              icon: Icon(Icons.delete))
        ],
        backgroundColor: Colors.red,
        title: Center(child: Text("COMPLETED TRIPS")),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ongoinglistnotifier.value.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/not.png",
                        height: 150,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "NO TRIPS IS ADDED",
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
                    Center(
                      child: Container(
                        width: 500,
                        height: 800,
                        child: ValueListenableBuilder(
                            valueListenable: ongoinglistnotifier,
                            builder: ((context, value, child) {
                              return ListView.separated(
                                  itemBuilder: ((context, index) {
                                    final data = value[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () async {},
                                        child: Card(
                                          color:
                                              Color.fromARGB(255, 37, 35, 35),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    data.Destination
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "From",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        data.startingdate,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        "-",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "To",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        data.endingdate,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      IconButton(
                                                          onPressed: (() async {
                                                            await displayalert(
                                                                context, data);
                                                            // await deletetripindividualy(
                                                            //    data.Destination);
                                                          }),
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    201,
                                                                    186,
                                                                    185),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              await completefooddetails(
                                                                  data.Destination);
                                                              await check(data
                                                                  .Destination);
                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          ((context) {
                                                                return detailscomplete(
                                                                  destinationname:
                                                                      data.Destination,
                                                                );
                                                              })));
                                                            },
                                                            child: Image.asset(
                                                              "assets/images/fastfood.png",
                                                              height: 50,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          const Text(
                                                            "FOOD ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              await completetraveldetails(
                                                                  data.Destination);
                                                              await checktravel(
                                                                  data.Destination);
                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          ((context) {
                                                                return detailstripcomplete(
                                                                  destinationname:
                                                                      data.Destination,
                                                                );
                                                              })));
                                                            },
                                                            child: Image.asset(
                                                              "assets/images/travel.png",
                                                              height: 50,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          const Text(
                                                            "TRAVEL",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {
                                                              await completestaydetails(
                                                                  data.Destination);
                                                              await checkstay(data
                                                                  .Destination);
                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          ((context) {
                                                                return staytripcomplete(
                                                                  destinationname:
                                                                      data.Destination,
                                                                );
                                                              })));
                                                            },
                                                            child: Image.asset(
                                                              "assets/images/stay.png",
                                                              height: 50,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          const Text(
                                                            "STAY",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextButton(
                                                          onPressed: (() async {
                                                            await check(data
                                                                .Destination);
                                                            await checktravel(
                                                                data.Destination);
                                                            await checkstay(data
                                                                .Destination);
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder:
                                                                        ((context) {
                                                              return total();
                                                            })));
                                                          }),
                                                          child: const Text(
                                                            "TOTAL",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                  separatorBuilder: ((context, index) {
                                    return Divider();
                                  }),
                                  itemCount: value.length);
                            })),
                      ),
                    )
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
