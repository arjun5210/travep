import 'package:againproject/db/fun.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(good),
          Center(
            child: ElevatedButton(
                onPressed: (() async {
                  setState(() {
                    good = "helooo";
                  });
                  print("changed");
                }),
                child: Text("first")),
          ),
          Text(good),
        ],
      ),
    );
  }
}
