import 'package:hive_flutter/adapters.dart';
part 'databaseongoing.g.dart';

@HiveType(typeId: 2)
class upcomingtrip {
  @HiveField(0)
  String destination;
  @HiveField(1)
  String startdate;

  @HiveField(2)
  String budget;
  @HiveField(3)
  String desc;
  @HiveField(4)
  String travelmode;
  @HiveField(5)
  String enddate;

  upcomingtrip({
    required this.destination,
    required this.startdate,
    required this.budget,
    required this.desc,
    required this.travelmode,
    required this.enddate,
  });
}
