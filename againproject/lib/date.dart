import 'package:againproject/db/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class colour extends StatefulWidget {
  colour({super.key});

  @override
  State<colour> createState() => _colourState();
}

class _colourState extends State<colour> {
  Color btcolour = Colors.yellow;
  Future change() async {
    setState(() {
      btcolour = Colors.red;
    });
  }

  @override
  void initState() {
    if (kumar == true) {
      Color btcolour = Colors.red;
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: (() async {
                    kumar = true;
                    await change();
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btcolour,
                  ),
                  child: Text("helooo")),
            )
          ],
        ),
      ),
    );
  }

  Future assam(ElevatedButton Style) async {}
}
