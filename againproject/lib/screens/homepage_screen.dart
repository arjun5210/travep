import 'dart:typed_data';
import 'dart:ui';

import 'package:againproject/about.dart';
import 'package:againproject/completedtrip.dart';
import 'package:againproject/image.dart';
import 'package:againproject/imagecomplete.dart';
import 'package:againproject/ongoingtestdisplay';
import 'package:againproject/ongoingtrips.dart';
import 'package:againproject/screens/add_upcoming_screen.dart';
import 'package:againproject/selectimage.dart';
import 'package:againproject/splashongoing.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class testpage extends StatelessWidget {
  const testpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
            child: Image.asset(
          "assets/images/TVLlogo.png",
          height: 100,
        )),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return aboutapp();
                })));
              }),
              icon: Icon(Icons.info)),
          IconButton(
              onPressed: (() async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return splash();
                    }),
                  ),
                );
              }),
              icon: Icon(Icons.details))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Image.asset(
                  'assets/images/pp.jpg',
                  // Original height
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: -100,
                  top: -100,
                  child: Image.asset(
                    'assets/images/title.png',
                    height: 380,

                    // Original height
                  ),
                ),
              ]),
              Image.asset(
                "assets/images/tv.png",
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return upcome();
                                })));
                              },
                              child: Image.network(
                                "https://images.pexels.com/photos/803105/pexels-photo-803105.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                width: 200,
                                height: 300,
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 20,
                            child: Text(
                              "Up Coming Trips",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                  Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return splash();
                                    }),
                                  ),
                                );
                              },
                              child: Image.network(
                                "https://images.pexels.com/photos/1995729/pexels-photo-1995729.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 10,
                            left: 10,
                            child: Text(
                              "On Going Trips",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return completeimage();
                      })));
                    },
                    child: Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://i.pinimg.com/originals/fc/2d/89/fc2d897f9ab62120e52c9c99355fef47.gif",
                              ),
                            ),
                            const Positioned(
                              bottom: 5,
                              left: 15,
                              child: Text(
                                "Memories",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return complete();
                      })));
                    },
                    child: Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "assets/images/chill.jpg",
                                  height: 150,
                                  fit: BoxFit.fill,
                                )),
                            const Positioned(
                              bottom: 5,
                              left: 15,
                              child: Text(
                                "Completed Trips",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future<Uint8List?> xFileToUint8List() async {
    final imgphoto = await ImagePicker().pickImage(source: ImageSource.camera);
    // ignore: unused_local_variable
    XFile? xFile = await imgphoto;

    // Read the file as bytes
    final bytes = await xFile!.readAsBytes();

    // Convert bytes to Uint8List
    final uint8list = Uint8List.fromList(bytes);
    final compressedBytes = await FlutterImageCompress.compressWithList(
      uint8list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 85,
      rotate: 0,
    );

    return uint8list;
  }
}
