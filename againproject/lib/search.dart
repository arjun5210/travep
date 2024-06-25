import 'package:againproject/databaseongoing.dart';
import 'package:againproject/db/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class searchdisplay extends StatefulWidget {
  searchdisplay({super.key});

  @override
  State<searchdisplay> createState() => _searchdisplayState();
}

class _searchdisplayState extends State<searchdisplay> {
  var searchcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: searchcontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: (() async {
                  await getdisplayvalues(searchcontroller.text, context);
                }),
                child: Text("search")),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: searchtriplistnotifier,
                builder: ((BuildContext, List<upcomingtrip> mp, Widget) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        final data = mp[index];

                        return ListTile(
                          title: Text(data.destination),
                          subtitle: Text(data.budget),
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
