import 'package:againproject/db/fun.dart';
import 'package:againproject/foodcheckresult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class searchset extends StatelessWidget {
  searchset({super.key});
  var name;
  final checkcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              controller: checkcontroller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: (() async {
                  await check(checkcontroller.text);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return checkfood();
                  })));
                }),
                child: Text("check"))
          ],
        ),
      ),
    );
  }
}
