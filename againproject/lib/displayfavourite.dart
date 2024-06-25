import 'package:againproject/db/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class fav extends StatelessWidget {
  const fav({super.key});

  @override
  Widget build(BuildContext context) {
    favouritetripdisplay();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 45, 13, 13),
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
            Padding(
              padding: const EdgeInsets.all(9),
              child: Card(
                color: Colors.indigo,
                elevation: 10,
                shadowColor: Colors.red,
                child: TextButton(
                    onPressed: (() async {
                      await deleteallfavourite();
                    }),
                    child: const Text(
                      "DELETE All",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: favouritetriplistnotifier.value.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/heart.png",
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "NO FAVOURITE TRIPS IS ADDED",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Center(
                        child: Text(
                          "Favorite Trips",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 500,
                        height: 600,
                        child: ValueListenableBuilder(
                            valueListenable: favouritetriplistnotifier,
                            builder: ((context, value, child) {
                              return ListView.separated(
                                  itemBuilder: ((context, index) {
                                    final data = value[index];
                                    DateTime gk =
                                        DateTime.parse(data.startdate);
                                    String formattedDateString =
                                        DateFormat('dd-MMM-yyy').format(gk);
                                    DateTime nk = DateTime.parse(data.enddate);
                                    String endformattedDateString =
                                        DateFormat('dd-MMM-yyy').format(nk);
                                    return Padding(
                                      padding: const EdgeInsets.all(11),
                                      child: Card(
                                        color: const Color.fromARGB(
                                            255, 37, 35, 35),
                                        elevation: 10,
                                        shadowColor: Colors.black,
                                        child: ListTile(
                                          title: Text(
                                            data.destination.toUpperCase(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Starting Date",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    formattedDateString,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Estimated Expense",
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
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Things to Remember",
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
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Travel Mode",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    data.travelmode,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          leading: Image.asset(
                                            "assets/images/travel.png",
                                            height: 50,
                                          ),
                                          trailing: IconButton(
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
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.red,
                                                          ),
                                                          onPressed: (() async {
                                                            await deletefavtrip(
                                                                data.destination);
                                                            print("deleted");
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                          child: Text("Yes")),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .indigo),
                                                          onPressed: (() async {
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                          child: Text("No"))
                                                    ],
                                                  );
                                                }),
                                              );
                                            }),
                                            icon: Icon(Icons.delete),
                                            color: Colors.red,
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
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
