import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'imediatelygoing.g.dart';

@HiveType(typeId: 6)
class imeongoing {
  @HiveField(0)
  String Destination;
  @HiveField(1)
  String startingdate;
  @HiveField(2)
  String endingdate;

  imeongoing({
    required this.Destination,
    required this.startingdate,
    required this.endingdate,
  });
}
