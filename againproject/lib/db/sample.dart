import 'package:hive/hive.dart';
part 'sample.g.dart';

@HiveType(typeId: 1)
class maketrip {
  @HiveField(0)
  var name;
  @HiveField(1)
  var date;
  @HiveField(2)
  String displaydate;

  maketrip({
    required this.name,
    required this.date,
    required this.displaydate,
  });
}
