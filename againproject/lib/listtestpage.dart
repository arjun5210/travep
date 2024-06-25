import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class listtest extends StatefulWidget {
  listtest({super.key});

  @override
  State<listtest> createState() => _listtestState();
}

class _listtestState extends State<listtest> {
  List names = ["one", "three"];

  List result = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  select(value);
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(result.toString()),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return Divider();
                  }),
                  itemCount: result.length)),
        ],
      ),
    ));
  }

  void select(String data) {
    result.clear();
    //  result = names.where((element) => names.contains(data)).toList();

    if (names.contains(data)) {
      result.add(data);
    }
  }
}
