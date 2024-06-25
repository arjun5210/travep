import 'package:hive_flutter/hive_flutter.dart';
part 'stayprice.g.dart';

@HiveType(typeId: 8)
class stayexp {
  @HiveField(0)
  String Destination;
  @HiveField(1)
  String startingdate;
  @HiveField(2)
  String price;

  stayexp({
    required this.Destination,
    required this.startingdate,
    required this.price,
  });
}
