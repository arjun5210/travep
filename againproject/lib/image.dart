import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'image.g.dart';

@HiveType(typeId: 4)
class tripimages {
  @HiveField(0)
  String? exp;
  @HiveField(1)
  Uint8List nameimage;
  @HiveField(2)
  String destination;

  tripimages(
      {required this.exp, required this.nameimage, required this.destination});
}
