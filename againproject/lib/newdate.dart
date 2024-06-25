import 'package:againproject/db/fun.dart';
import 'package:againproject/db/sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class viewdate extends StatefulWidget {
  viewdate({super.key});

  @override
  State<viewdate> createState() => _viewdateState();
}

class _viewdateState extends State<viewdate> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  final datedatecontroller = TextEditingController();
  final namenamecontroller = TextEditingController();
  String initialvalue = "bus";
  final displaydatecontroller = TextEditingController();

  var formatedtext;
  DateTime? orignal;

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  late String ab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: namenamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: datedatecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextFormField(
              controller: displaydatecontroller,
              decoration: InputDecoration(
                  suffixIcon: TextButton(
                      onPressed: (() async {
                        final regular = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025));

                        if (regular != null) {
                          String formatedtext =
                              DateFormat("dd-MM-yyy").format(orignal!);
                          setState(() async {
                            displaydatecontroller.text = await formatedtext;
                            print(formatedtext);
                          });
                        } else {
                          setState(() {
                            displaydatecontroller.text = formatedtext;
                            print(formatedtext);
                          });

                          print("soryyyy");
                        }

                        print(" with out $regular");
                      }),
                      child: Text("selectdate")),
                  hintText: formatedtext,
                  border: OutlineInputBorder()),
            ),
            ElevatedButton(onPressed: (() async {}), child: Text("submit")),
            ElevatedButton(
                onPressed: (() async {
                  await d();
                }),
                child: Text("del")),
            DropdownButton(
                value: initialvalue,
                icon: Icon(Icons.arrow_back),
                items: [
                  DropdownMenuItem(value: 'bus', child: Text("bus")),
                  DropdownMenuItem(value: 'train', child: Text("train"))
                ],
                onChanged: ((newvalue) {
                  setState(() {
                    initialvalue = newvalue!;
                    print(initialvalue);
                  });
                })),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: maketriplistnotifier,
                builder: ((BuildContext, List<maketrip> mp, Widget) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        final data = mp[index];

                        return ListTile(
                          title: Text(data.name),
                          subtitle: Text(data.date),
                        );
                      }),
                      separatorBuilder: ((context, index) {
                        return Divider();
                      }),
                      itemCount: mp.length);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
