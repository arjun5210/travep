import 'dart:io';
import 'dart:typed_data';

import 'package:againproject/db/fun.dart';
import 'package:againproject/detailsofselectedimages.dart';
import 'package:againproject/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class imageselect extends StatefulWidget {
  imageselect({super.key, required this.des});
  String des;

  @override
  State<imageselect> createState() => _imageselectState();
}

class _imageselectState extends State<imageselect> {
  final namecontroller = TextEditingController();

  File? _image;

  @override
  void initState() {
    picturetrip(widget.des);
    // TODO: implement initState
    super.initState();
  }

  // imageselect slt = imageselect(des: widget.des);
  Uint8List? cmp;

  void assignValue(Uint8List value) {
    cmp = value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Text("ADD IMAGES TO "),
              SizedBox(
                width: 50,
              ),
              Center(
                  child: Text(
                widget.des.toUpperCase(),
                style: TextStyle(color: Colors.black),
              )),
            ],
          ),
          actions: [
            IconButton(
                onPressed: (() async {
                  await xFileToUint8List();
                  await picturetrip(widget.des);
                }),
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                )),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: ValueListenableBuilder(
                    valueListenable: completetripimagelistnotifier,
                    builder: ((context, value, child) {
                      return GridView.count(
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          crossAxisCount: 3,
                          children: List.generate(value.length, ((index) {
                            final data = value[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: ((context) {
                                    return imagedetails(imgs: data);
                                  })));
                                }),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 37, 35, 35),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.memory(
                                          data.nameimage,
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })));
                    })))
          ],
        ),
      ),
    );
  }

  Future<Uint8List?> xFileToUint8List() async {
    final imgphoto = await ImagePicker().pickImage(source: ImageSource.gallery);
    // ignore: unused_local_variable
    XFile? xFile = await imgphoto;
    setState(() {
      if (imgphoto != null) {
        _image = File(imgphoto.path);
      } else {
        print('No image selected.');
      }
    });

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
    final cmp = await compressedBytes;
    final ck = tripimages(
        nameimage: compressedBytes,
        exp: namecontroller.text,
        destination: widget.des);
    await picture(ck);

    return uint8list;
  }

  Future savedimages(Uint8List name, String exp) async {
    if (cmp == null) {
      print("fuckkk");
    }
  }

  Future displayalert(BuildContext context, data) async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            title: Text("Are you Sure !!!"),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: (() async {
                    await deleteimagetrip(widget.des);

                    print("deleted");
                    Navigator.pop(context);
                  }),
                  child: Text("Yes")),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  onPressed: (() async {
                    Navigator.pop(context);
                  }),
                  child: Text("No"))
            ],
          );
        }));
  }
}
