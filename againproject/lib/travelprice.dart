import 'package:hive_flutter/adapters.dart';
part 'travelprice.g.dart';

@HiveType(typeId: 7)
class travelexp {
  @HiveField(0)
  String Destination;
  @HiveField(1)
  String startingdate;
  @HiveField(2)
  String price;
  @HiveField(3)
  String mode;

  travelexp(
      {required this.Destination,
      required this.startingdate,
      required this.price,
      required this.mode});
}
