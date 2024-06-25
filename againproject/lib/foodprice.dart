import 'package:hive_flutter/adapters.dart';
part 'foodprice.g.dart';

@HiveType(typeId: 5)
class food {
  @HiveField(0)
  String Destination;
  @HiveField(1)
  String startingdate;
  @HiveField(2)
  String foodtype;
  @HiveField(3)
  String price;
  food(
      {required this.Destination,
      required this.startingdate,
      required this.foodtype,
      required this.price});
}
