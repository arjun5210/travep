import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:againproject/db/fun.dart';

class oneby extends StatefulWidget {
  oneby({super.key});

  @override
  State<oneby> createState() => _onebyState();
}

class _onebyState extends State<oneby> {
  final gh = TextEditingController();
  @override
  void initState() {
    _loadStringValue();
    // TODO: implement initState
    super.initState();
  }

  String _stringValue = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: gh,
            decoration: InputDecoration(labelText: 'Enter a string'),
          ),
          ElevatedButton(
              onPressed: (() async {
                _saveStringValue(gh.text);
              }),
              child: Text("set")),
          Text(_stringValue),
          Text(lorry),
        ],
      ),
    ));
  }

  _loadStringValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _stringValue = prefs.getString('myStringKey') ?? '';
      lorry = _stringValue;
    });
  }

  _saveStringValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('myStringKey', value);
  }
}
