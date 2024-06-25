import 'package:againproject/db/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class checkfood extends StatefulWidget {
  checkfood({super.key});

  @override
  State<checkfood> createState() => _checkfoodState();
}

class _checkfoodState extends State<checkfood> {
  List<int> result = [1, 2, 3];
  @override
  void initState() {
    intList.clear();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      body: Column(
        children: [
          Text("helooo"),
          Container(
              width: 400,
              color: Colors.red,
              child: Center(
                child: Text(
                  sum.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
