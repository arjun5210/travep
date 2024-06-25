import 'package:againproject/db/fun.dart';
import 'package:againproject/foodselect.dart';
import 'package:againproject/splashongoing.dart';
import 'package:againproject/stayslectingpage.dart';
import 'package:againproject/travelmodeselect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class selectpagetwo extends StatelessWidget {
  selectpagetwo(
      {super.key, required this.destinationname, required this.stdate});

  String destinationname;
  String stdate;
  DateTime current = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (() {}), icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.red,
        title: Center(
          child: Image.asset(
            "assets/images/TVLlogo.png",
            height: 100,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: (() async {
                  String fg = DateFormat("dd-MM-yyy").format(current);
                  await updateendingdate(destinationname, stdate, fg);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: ((context) {
                    return splash();
                  })), (route) => false);
                }),
                child: Text("Exit from Trip")),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 37, 35, 35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Currently Travelling to ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        destinationname.toUpperCase(),
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            "assets/images/tv.png",
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 37, 35, 35),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return fooditemselected(
                                  gold: destinationname, start: stdate);
                            },
                          ));
                        },
                        child: Container(
                          width: 150,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 18, 18, 18),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/fastfood.png",
                                  height: 70,
                                ),
                              ),
                              const Text(
                                "FOOD EXPENCE",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return stayitemselected(
                                  gold: destinationname, start: stdate);
                            },
                          ));
                        },
                        child: Container(
                          width: 150,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 18, 18, 18),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/stay.png",
                                  height: 70,
                                ),
                              ),
                              const Text(
                                "STAY EXPENCE",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: ((context) {
                            return travelselect(
                                destinationname: destinationname,
                                startdate: stdate);
                          })));
                        }),
                        child: Container(
                          width: 150,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 18, 18, 18),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/car.png",
                                  height: 70,
                                ),
                              ),
                              const Text(
                                "TRAVEL EXPENCE",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Future alertshow(BuildContext context) async {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Text("Are you Sure want to exit !!!"),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: (() async {
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
}
