import 'dart:ui';

import 'package:againproject/completedetailstrip.dart';
import 'package:againproject/completestaytipdetails.dart';
import 'package:againproject/completetraveldetailstrip.dart';
import 'package:againproject/db/fun.dart';
import 'package:againproject/ongoingtrips.dart';
import 'package:againproject/selectimage.dart';
import 'package:againproject/totaldisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class completeimage extends StatefulWidget {
  const completeimage({super.key});

  @override
  State<completeimage> createState() => _completeimageState();
}

class _completeimageState extends State<completeimage> {
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
        backgroundColor: Colors.red,
        title: Center(child: Text("TRIP GALLERY")),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ongoinglistnotifier.value.isEmpty
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
                        "NO TRIP IS ADDED",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder:
                                                                        ((context) {
                                                              return imageselect(
                                                                  des: data
                                                                      .Destination);
                                                            })));
                                                            await imageselect(
                                                                des: data
                                                                    .Destination);
                                                          }),
                                                          icon: Icon(
                                                            Icons.image,
                                                            size: 30,
                                                            color: Colors.white,
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
}
