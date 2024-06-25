import 'package:againproject/db/fun.dart';
import 'package:againproject/foodselect.dart';
import 'package:againproject/ongoingtestdisplay';
import 'package:againproject/ongoingtrips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash extends StatefulWidget {
  splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    checkhope(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("splash"),
        ],
      ),
    );
  }

  Future checking() async {
    checkhope(context);
  }
}
