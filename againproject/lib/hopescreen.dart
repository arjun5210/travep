import 'package:againproject/db/fun.dart';
import 'package:againproject/foodselect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class hope extends StatelessWidget {
  const hope({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(lorry)),
          TextButton(
              onPressed: (() async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return fooditemselected(gold: lorry, start: "lll");
                })));
              }),
              child: Text("mmm")),
        ],
      ),
    ));
  }
}
