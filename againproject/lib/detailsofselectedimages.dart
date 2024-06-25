import 'package:againproject/db/fun.dart';
import 'package:againproject/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class imagedetails extends StatelessWidget {
  imagedetails({required this.imgs});
  tripimages imgs;
  final namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 500,
                      child: Image.memory(imgs.nameimage),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (() async {
                      await deleteimageindividuallytrip(imgs.nameimage);
                      Navigator.pop(context);
                    }),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: "Add experiences",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo),
                    onPressed: (() async {
                      pictureupdate(imgs.nameimage, namecontroller.text);
                    }),
                    child: Text("ADD")),
                Container(
                  height: 200,
                  width: 500,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          imgs.exp!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
