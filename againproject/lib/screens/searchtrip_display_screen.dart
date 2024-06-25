import 'package:againproject/databaseongoing.dart';
import 'package:againproject/db/fun.dart';

import 'package:flutter/material.dart';

class ongoingsearch extends StatefulWidget {
  ongoingsearch({super.key});

  @override
  State<ongoingsearch> createState() => _ongoingsearchState();
}

class _ongoingsearchState extends State<ongoingsearch> {
  var searchcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  @override
  @override
  void initState() {
    searchtriplistnotifier.value.clear();

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: (() async {
                    Navigator.pop(context);
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
                        const SizedBox(
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
                                      "assets/images/seo.png",
                                      height: 80,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  const Text(
                                    "SEARCH TRIPS",
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: TextFormField(
                                        onChanged: ((value) {
                                          setState(() {
                                            searchtriplistnotifier.value
                                                .clear();
                                            searchtriplistnotifier
                                                .notifyListeners();
                                            getdisplayvalues(value, context);
                                          });
                                        }),
                                        validator: ((value) {
                                          if (value == null || value.isEmpty) {
                                            return 'error';
                                          }
                                        }),
                                        style: const TextStyle(
                                            color: Colors.white),
                                        controller: searchcontroller,
                                        decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          label: Text(
                                            "Enter Destination name",
                                            style:
                                                TextStyle(color: Colors.grey),
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
                                    // Align(
                                    //   alignment: Alignment.centerLeft,
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(18),
                                    //     child: ElevatedButton(
                                    //       style: ElevatedButton.styleFrom(
                                    //           backgroundColor: Colors.indigo),
                                    //       onPressed: (() async {
                                    //         searchtriplistnotifier.value
                                    //             .clear();

                                    //         if (formkey.currentState!
                                    //             .validate()) {
                                    //           await getdisplayvalues(
                                    //               searchcontroller.text,
                                    //               context);
                                    //         }
                                    //       }),
                                    //       child: Image.asset(
                                    //         "assets/images/searchp.png",
                                    //         height: 30,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: searchtriplistnotifier,
                            builder:
                                ((BuildContext, List<upcomingtrip> mp, Widget) {
                              return ListView.separated(
                                  itemBuilder: ((context, index) {
                                    final data = mp[index];

                                    return Padding(
                                      padding: const EdgeInsets.all(25),
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
                                          color:
                                              Color.fromARGB(255, 37, 35, 35),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
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
                                                      data.startdate,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Ending Date",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      data.enddate,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Estimated Expences",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Things to Remember",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        iconSize: 30,
                                                        color: Colors.white,
                                                        onPressed: (() {}),
                                                        icon:
                                                            Icon(Icons.delete)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    IconButton(
                                                        color: Colors.white,
                                                        iconSize: 30,
                                                        onPressed: (() {}),
                                                        icon: const Icon(Icons
                                                            .update_rounded)),
                                                    IconButton(
                                                        color: Colors.white,
                                                        iconSize: 30,
                                                        onPressed: (() {}),
                                                        icon: Icon(
                                                            Icons.favorite)),
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
                  ),
                ),
              ),
            )));
  }
}
