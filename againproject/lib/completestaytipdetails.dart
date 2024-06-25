import 'dart:ui';

import 'package:againproject/db/fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class staytripcomplete extends StatefulWidget {
  staytripcomplete({super.key, required this.destinationname});
  String destinationname;

  @override
  State<staytripcomplete> createState() => _staytripcompleteState();
}

class _staytripcompleteState extends State<staytripcomplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("TRAVEL EXPENCE")),
        leading: IconButton(
            onPressed: (() {
              completestaylistnotifier.value.clear();
              return Navigator.pop(context);
            }),
            icon: Icon(Icons.arrow_back)),
        actions: [
          Row(
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 40,
              ),
              Text("Rs"),
              Text(
                sumtwo.toString(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: completestaylistnotifier.value.isEmpty
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
                        "NO STAY EXPENCE IS ADDED",
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
                  children: [
                    Container(
                      width: 500,
                      height: 850,
                      child: ValueListenableBuilder(
                          valueListenable: completestaylistnotifier,
                          builder: ((context, value, child) {
                            return ListView.separated(
                                itemBuilder: ((context, index) {
                                  final data = value[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 37, 35, 35),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "DATE",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  data.startingdate,
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
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
                                              children: [
                                                const Text(
                                                  "PRICE",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "RS",
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        data.price,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            data.Destination,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                                separatorBuilder: ((context, index) {
                                  return const Divider();
                                }),
                                itemCount: value.length);
                          })),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
