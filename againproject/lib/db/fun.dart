import 'dart:async';
import 'dart:ui';

import 'package:againproject/databaseongoing.dart';
import 'package:againproject/db/sample.dart';
import 'package:againproject/favorite.dart';
import 'package:againproject/foodprice.dart';
import 'package:againproject/foodselect.dart';
import 'package:againproject/image.dart';
import 'package:againproject/imediatelygoing.dart';
import 'package:againproject/main.dart';
import 'package:againproject/ongoingtrips.dart';
import 'package:againproject/screens/allselecting_screen.dart';
import 'package:againproject/splashongoing.dart';
import 'package:againproject/stayprice.dart';
import 'package:againproject/travelprice.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<List<maketrip>> maketriplistnotifier = ValueNotifier([]);
ValueNotifier<List<upcomingtrip>> upcomingtriplistnotifier = ValueNotifier([]);
ValueNotifier<List<upcomingtrip>> searchtriplistnotifier = ValueNotifier([]);
ValueNotifier<List<upcomingtrip>> displaysearchview = ValueNotifier([]);
ValueNotifier<List<favoritetrip>> favouritetriplistnotifier = ValueNotifier([]);
ValueNotifier<List<upcomingtrip>> searchdatetriplistnotifier =
    ValueNotifier([]);
ValueNotifier<List<tripimages>> imagestriplistnotifier = ValueNotifier([]);
ValueNotifier<List<food>> foodlistnotifier = ValueNotifier([]);
ValueNotifier<List<imeongoing>> ongoinglistnotifier = ValueNotifier([]);
ValueNotifier<List<food>> completefoodlistnotifier = ValueNotifier([]);
ValueNotifier<List<travelexp>> travellistnotifier = ValueNotifier([]);
ValueNotifier<List<travelexp>> completetravellistnotifier = ValueNotifier([]);
ValueNotifier<List<stayexp>> staylistnotifier = ValueNotifier([]);
ValueNotifier<List<stayexp>> completestaylistnotifier = ValueNotifier([]);
ValueNotifier<List<tripimages>> completetripimagelistnotifier =
    ValueNotifier([]);
ValueNotifier<List<upcomingtrip>> dateupcomingdisplaylistnotifier =
    ValueNotifier([]);
ValueNotifier<List<favoritetrip>> hearttriplistnotifier = ValueNotifier([]);

List progress = ["kk"];

bool kumar = false;
String lorry = '';
List fun = [];
List funtwo = [];
List<int> intListtwo = [];
var bg = Colors.white;
List kgf = [];
List rolex = [];

List funone = [];
List searchresult = [];
List _searchResults = [];
List abcd = [];
List result = [];
List<favoritetrip> bj = [];
String good = "very";
int sum = 0;
int sumone = 0;
int sumtwo = 0;
int jk = 0;
List<int> intList = [];
List<int> intListone = [];
String destinationamename = " kl";
List<String> descc = [" "];
List<String> desctwo = [" "];
List<imeongoing> jd = [];
List<favoritetrip> cc = [];

Future add(maketrip value) async {
  final instmk = await Hive.openBox<maketrip>('travell');
  await instmk.add(value);
  print("added to tabel");

  maketriplistnotifier.value.add(value);
  print("added to list");

  maketriplistnotifier.notifyListeners();
  await getdata();
}

Future getdata() async {
  final instmk = await Hive.openBox<maketrip>('travell');

  maketriplistnotifier.value.addAll(instmk.values);
  maketriplistnotifier.notifyListeners();
}

Future d() async {
  final instmk = await Hive.openBox<maketrip>('travell');

  instmk.clear();
  maketriplistnotifier.value.clear();
  maketriplistnotifier.notifyListeners();
}

//////////////project -started-//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
Future addtrip(upcomingtrip value) async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');
  instupcoming.add(value);
  upcomingtriplistnotifier.value.add(value);
  upcomingtriplistnotifier.notifyListeners();
}

Future displayupcomingtrips() async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');
  upcomingtriplistnotifier.value.clear();

  upcomingtriplistnotifier.value.addAll(instupcoming.values);
  upcomingtriplistnotifier.notifyListeners();
}

Future delete() async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');
  instupcoming.clear();
  upcomingtriplistnotifier.value.clear();
  upcomingtriplistnotifier.notifyListeners();
  await deleteallfavourite();
}
//////////////////////search -item set/////////////////////////////////////////////////////////////////////////

Future getdisplayvalues(String uv, context) async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');

  final as = await Hive.box<upcomingtrip>('trip')
      .values
      .where((person) => person.destination.contains(uv))
      .toList();
  searchtriplistnotifier.value.addAll(as);
  searchtriplistnotifier.notifyListeners();
  if (as.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Invalid Trip",
          style: TextStyle(color: Colors.white),
        )));
    print("not found");
  }

  await instupcoming.close();
}

Future deletetrip(String name) async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');
  // await instupcoming.delete(budget);
  // print("individualy deleted");
  final recordIndex = instupcoming.values
      .toList()
      .indexWhere((element) => element.destination == name);
  if (recordIndex != -1) {
    instupcoming.deleteAt(recordIndex);
    print('Record with name $name deleted successfully');
  } else {
    print('Record with name $name not found');
  }
  upcomingtriplistnotifier.value.clear();

  upcomingtriplistnotifier.notifyListeners();
  await deletefavtrip(name);

  await displayupcomingtrips();
  await favouritetripdisplay();
}

Future favouritetripadd(favoritetrip values, String name, context) async {
  final favinst = await Hive.openBox<favoritetrip>('favtrip');

  final bj = favinst.values
      .where((element) => element.destination.contains(name))
      .toList();
  if (bj.isEmpty) {
    favinst.add(values);

    favouritetriplistnotifier.value.add(values);
    favouritetriplistnotifier.notifyListeners();

    print("favourite trip added succesfully");
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Added to Favourite Trip",
          style: TextStyle(color: Colors.white),
        )));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          " Trip Already Added",
          style: TextStyle(color: Colors.white),
        )));
    print("soryyyy the trip is already added");
  }
}


Future favouritetripdisplay() async {
  progress.clear();
  final favinst = await Hive.openBox<favoritetrip>('favtrip');

  favouritetriplistnotifier.value.clear();
  favouritetriplistnotifier.value.addAll(favinst.values);
  // progress.add(favinst.values.first.destination);
  var kk = favinst.values.forEach((element) {
    progress.add(element.destination);
  });

  favouritetriplistnotifier.notifyListeners();
}

Future deleteallfavourite() async {
  final favinst = await Hive.openBox<favoritetrip>('favtrip');
  favinst.clear();

  favouritetriplistnotifier.value.clear();
  favouritetriplistnotifier.notifyListeners();
  print("delete all favourite trips");
}

Future deletefavtrip(String name) async {
  final instfav = await Hive.openBox<favoritetrip>('favtrip');
  // await instupcoming.delete(budget);
  // print("individualy deleted");
  final recordIndex = instfav.values
      .toList()
      .indexWhere((element) => element.destination == name);
  if (recordIndex != -1) {
    instfav.deleteAt(recordIndex);
    print('Record with name $name deleted successfully');
  } else {
    print('Record with name $name not found');
  }
  favouritetriplistnotifier.value.clear();

  favouritetriplistnotifier.notifyListeners();

  await favouritetripdisplay();
}

Future filterdate(DateTime searchstart, DateTime searchenddate) async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');

  // final up = instupcoming.values
  //   .where((element) =>
  //        searchstart.isAfter(element.sd) || searchenddate.isBefore(element.ed))
  //    .toList();
  // final up = instupcoming.values
  //   .where((element) =>
  //     element.sd.isAfter(searchstart) & element.ed.isBefore(searchenddate))
  //  .toList();
  // if (up.isNotEmpty) {
  //   searchdatetriplistnotifier.value.addAll(up);
  //   searchdatetriplistnotifier.notifyListeners();
  //} else {

  //////////////////////////////////////////////////////////////////setayii//////////////////partiallyy//////filter
  abcd.addAll(upcomingtriplistnotifier.value
      .where((element) =>
          DateTime.parse(element.startdate).isBefore(searchenddate))
      .toList());
  if (abcd.isNotEmpty) {
    // searchdatetriplistnotifier.value.addAll();
    // searchdatetriplistnotifier.notifyListeners();
    print("yesss");
  } else {
    print("issuess");
  }
  final gt = instupcoming.values
      .where(
          (element) => DateTime.parse(element.startdate).isAfter(searchenddate))
      .toList();

  /////////////////////////////////////////////////////////////////nokkitilaa/////////////////////////////////////////////////
  final uig = await instupcoming.values
      .where(
          (element) => DateTime.parse(element.startdate).isAfter(searchstart))
      .toList();

  if (uig.isNotEmpty) {
    searchdatetriplistnotifier.value.addAll(uig);
    searchdatetriplistnotifier.notifyListeners();
    print("ok");
  } else {
    print("soryyy no date between");
  }
  final box = Hive.box<upcomingtrip>('trip');
  final List<dynamic> records = box.values.where((date) {
    DateTime recordDate = DateTime.parse(date.startdate);
    if (recordDate.isBefore(searchstart)) {
      print("yseee");
    } else {
      print("nooo");
    }
    return recordDate.isAfter(searchstart);
  }).toList();
  if (records.isNotEmpty) {
    print("dates found in this range");
  } else {
    print("not found");
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // bool dateInRange(DateTime storedDate, DateTime startDate, DateTime endDate) {
  //   return storedDate.isAfter(startDate) && storedDate.isBefore(endDate);
//  }

  //}
  result = instupcoming.values.toList();
}

/////////////////////////////////////////////datefilterkorachhsetayiii////////////////////////////////////////////////////////////////////////
void checkDatesInRange(DateTime startDate, DateTime endDate) async {
  if (startDate == null || endDate == null) {
    // Start date or end date not selected
    return;
  }

  // Open the Hive box
  final box = Hive.box<upcomingtrip>('trip');

  // Query the box for records within the selected date range
  final List<upcomingtrip> records = box.values.where((date) {
    DateTime recordDate = DateTime.parse(date.startdate);
    return recordDate.isAfter(startDate) && recordDate.isBefore(endDate);
  }).toList();
  if (records.isNotEmpty) {
    searchdatetriplistnotifier.notifyListeners();
    searchdatetriplistnotifier.value.addAll(records);
    searchdatetriplistnotifier.notifyListeners();
    print("yessssssss date found");
  } else {
    print("nooooooooooooooooooo");
  }
}

Future updatetrip(upcomingtrip value) async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');
  final kp = instupcoming.values
      .firstWhere((student) => student.destination == value.destination);

  // final kp = instupcoming.get('upcomingtrip');
  if (kp != null) {
    kp.desc = value.desc;

    kp.budget = value.budget;
    kp.startdate = value.startdate;
    kp.enddate = value.enddate;
    kp.travelmode = value.travelmode;
    // Update age
    // Save updated data back to box
  }

  upcomingtriplistnotifier.value.add(value);
  upcomingtriplistnotifier.notifyListeners();
}

Future update(String name, String desc, String exp, String startdate,
    String enddate, String travelmode) async {
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');
  var sd =
      instupcoming.values.firstWhere((student) => student.destination == name);

  final recordIndex = instupcoming.values
      .toList()
      .indexWhere((element) => element.destination == name);
  if (recordIndex != -1) {
    instupcoming.deleteAt(recordIndex);
  }
  sd.destination = name;

  sd.desc = desc;

  sd.budget = exp;
  sd.startdate = startdate;
  sd.enddate = enddate;
  sd.travelmode = travelmode;

  instupcoming.add(sd);
  // upcomingtriplistnotifier.value.add(sd);
  // upcomingtriplistnotifier.notifyListeners();

  print("updated");
  await displayupcomingtrips();
}

Future picture(tripimages value) async {
  final img = await Hive.openBox<tripimages>('travelimages');
  img.add(value);
  imagestriplistnotifier.value.add(value);
  imagestriplistnotifier.notifyListeners();
}

Future picturedisplay() async {
  final img = await Hive.openBox<tripimages>('travelimages');
  imagestriplistnotifier.value.clear();

  imagestriplistnotifier.value.addAll(img.values);
  imagestriplistnotifier.notifyListeners();
}

Future picturetrip(String name) async {
  completetripimagelistnotifier.value.clear();
  final img = await Hive.openBox<tripimages>('travelimages');
  final bj = img.values
      .where((element) => element.destination.contains(name))
      .toList();
  if (bj.isNotEmpty) {
    completetripimagelistnotifier.value.addAll(bj);
    completetripimagelistnotifier.notifyListeners();
  }
}

Future deleteimagetrip(String name) async {
  final img = await Hive.openBox<tripimages>('travelimages');
  // await instupcoming.delete(budget);
  // print("individualy deleted");
  final recordIndex =
      img.values.toList().indexWhere((element) => element.destination == name);
  if (recordIndex != -1) {
    img.deleteAt(recordIndex);
    print('Record with name $name deleted successfully');
  } else {
    print('Record with name $name not found');
  }
  completetripimagelistnotifier.value.clear();

  completetripimagelistnotifier.notifyListeners();

  await picturetrip(name);
}

Future deleteimageindividuallytrip(Uint8List name) async {
  final img = await Hive.openBox<tripimages>('travelimages');
  // await instupcoming.delete(budget);
  // print("individualy deleted");
  final recordIndex =
      img.values.toList().indexWhere((element) => element.nameimage == name);
  if (recordIndex != -1) {
    img.deleteAt(recordIndex);
    print("deleted");
  } else {
    print("no");
  }
  completetripimagelistnotifier.value.clear();

  completetripimagelistnotifier.notifyListeners();
}

Future pictureupdate(Uint8List name, String exp) async {
  final img = await Hive.openBox<tripimages>('travelimages');
  var gm = img.values.firstWhere((element) => element.nameimage == name);
  if (gm != null) {
    gm.exp = exp;
  }
  print("image updated");
  await picturedisplay();
}

Future deleteallpictures() async {
  final img = await Hive.openBox<tripimages>('travelimages');
  img.clear();
  imagestriplistnotifier.value.clear();
  imagestriplistnotifier.notifyListeners();
  print("delete all pictures");
}

Future addfood(food value) async {
  final foodexp = await Hive.openBox<food>('fooddetails');
  foodexp.add(value);
  foodlistnotifier.value.add(value);
  print(foodlistnotifier);
  foodlistnotifier.notifyListeners();
  print("saved");
}

Future check(String desname) async {
  fun.clear();
  intList.clear();
  sum = 0;

  final foodexp = await Hive.openBox<food>('fooddetails');

  final hj = foodexp.values
      .where((element) => element.Destination == desname)
      .toList();

  if (hj.isEmpty) {
    print("no same");
  } else {
    print("same found");
    List<int> intList = hj.map((str) => int.parse(str.price)).toList();
    for (var i in hj) {
      fun.add(i.price);
    }
    intList = fun.map((str) => int.parse(str)).toList();
    print(fun);
    for (int i = 0; i < intList.length; i++) {
      sum = sum + intList[i];
    }
    print(sum);
  }
}

Future checkdisplay() async {}

Future deleteallfood() async {
  final foodexp = await Hive.openBox<food>('fooddetails');

  foodexp.clear();
  foodlistnotifier.value.clear();
  foodlistnotifier.notifyListeners();
  print("delete all food");
}

Future fooddisplay() async {
  final foodexp = await Hive.openBox<food>('fooddetails');
  foodlistnotifier.value.clear();
  foodlistnotifier.value.addAll(foodexp.values);
  foodlistnotifier.notifyListeners();
}

Future addongoing(imeongoing jk) async {
  final ongoing = await Hive.openBox<imeongoing>('ongoingetails');
  ongoing.add(jk);
  ongoinglistnotifier.value.add(jk);
  ongoinglistnotifier.notifyListeners();
  print("ongoing saved");
}

Future displayongoingtrip() async {
  final ongoing = await Hive.openBox<imeongoing>('ongoingetails');
  final favinst = await Hive.openBox<favoritetrip>('favtrip');
  kgf.addAll(favinst.values);

  ongoinglistnotifier.value.clear();
  ongoinglistnotifier.value.addAll(ongoing.values);
  ongoinglistnotifier.notifyListeners();
}

Future updateendingdate(String name, String startdate, String enddate) async {
  final ongoing = await Hive.openBox<imeongoing>('ongoingetails');
  var student =
      ongoing.values.firstWhere((student) => student.Destination == name);

  if (student != null) {
    student.Destination = name;

    student.startingdate = startdate;

    student.endingdate = enddate;
  }
  final recordIndex = ongoing.values
      .toList()
      .indexWhere((element) => element.Destination == name);
  if (recordIndex != -1) {
    ongoing.deleteAt(recordIndex);
    print('Record with name $name deleted successfully');
  } else {
    print('Record with name $name not found');
  }

  ongoing.put(name, student);

  ongoinglistnotifier.value.clear();

  print("updated ongoing");
}
////////////////////checkhopesetayiiiii///////////////

Future checkhope(context) async {
  final ongoing = await Hive.openBox<imeongoing>('ongoingetails');
  final jj = ongoing.values
      .where((element) => element.endingdate.contains("default"))
      .toList();

  if (jj.isNotEmpty) {
    print("not permission to entry to ongoing");
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return selectpagetwo(
        destinationname: jj.first.Destination,
        stdate: jj.first.startingdate,
      );
    })));
    print("the name is");
    print(jj.first);
    print(lorry);
  } else {
    print(jj.length);
    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
      return ongoings();
    })));

    print("permission granded");
  }
  print(jj.length);
}

Future deleteongoing() async {
  final ongoing = await Hive.openBox<imeongoing>('ongoingetails');
  ongoing.clear();
  ongoinglistnotifier.value.clear();
  ongoinglistnotifier.notifyListeners();
  await displayongoingtrip();

  print("ongoing deleted");
}

Future checkfinal(context) async {
  final check = await SharedPreferences.getInstance();

  final jk = check.getBool(savekey);
  if (jk == true) {
    // ignore: use_build_context_synchronously
    print("not permission to entry to ongoing");

    await Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return fooditemselected(gold: lorry, start: "lk");
    })));
  } else {
    // ignore: use_build_context_synchronously
    print("permission granded");
    await Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
      return ongoings();
    })));
  }
}

Future completefooddetails(String name) async {
  completefoodlistnotifier.value.clear();
  final foodexp = await Hive.openBox<food>('fooddetails');
  final bj = foodexp.values
      .where((element) => element.Destination.contains(name))
      .toList();
  if (bj.isNotEmpty) {
    completefoodlistnotifier.value.addAll(bj);
    completefoodlistnotifier.notifyListeners();
  }
}

Future addtravelexp(travelexp value) async {
  final texp = await Hive.openBox<travelexp>('tripexpence');
  texp.add(value);
  travellistnotifier.value.add(value);
  travellistnotifier.notifyListeners();
  print("travel expence added");
}

Future displaytravelexp() async {
  final texp = await Hive.openBox<travelexp>('tripexpence');
  travellistnotifier.value.clear();
  travellistnotifier.value.addAll(texp.values);
  travellistnotifier.notifyListeners();
}

Future deletetravelexp() async {
  final texp = await Hive.openBox<travelexp>('tripexpence');

  texp.clear();
  travellistnotifier.value.clear();
  travellistnotifier.notifyListeners();
  await displaytravelexp();
}

Future checktravel(String desname) async {
  funone.clear();
  intListone.clear();
  sumone = 0;

  final texp = await Hive.openBox<travelexp>('tripexpence');

  final hk =
      texp.values.where((element) => element.Destination == desname).toList();

  if (hk.isEmpty) {
    print("no same");
  } else {
    print("same found");
    List<int> intListone = hk.map((str) => int.parse(str.price)).toList();
    for (var i in hk) {
      funone.add(i.price);
    }
    intListone = funone.map((str) => int.parse(str)).toList();
    print(funone);
    for (int i = 0; i < intListone.length; i++) {
      sumone = sumone + intListone[i];
    }
    print(sumone);
  }
}

Future completetraveldetails(String name) async {
  completetravellistnotifier.value.clear();
  final texp = await Hive.openBox<travelexp>('tripexpence');

  final ck = texp.values
      .where((element) => element.Destination.contains(name))
      .toList();
  if (ck.isNotEmpty) {
    completetravellistnotifier.value.addAll(ck);
    completetravellistnotifier.notifyListeners();
  }
}

Future addstayexp(stayexp value) async {
  final stexp = await Hive.openBox<stayexp>('stayexpence');
  stexp.add(value);
  staylistnotifier.value.add(value);
  staylistnotifier.notifyListeners();
  print("stay expence added");
}

Future displaystayexp() async {
  final stexp = await Hive.openBox<stayexp>('stayexpence');

  staylistnotifier.value.clear();
  staylistnotifier.value.addAll(stexp.values);
  staylistnotifier.notifyListeners();
}

Future completestaydetails(String name) async {
  completestaylistnotifier.value.clear();
  final stexp = await Hive.openBox<stayexp>('stayexpence');

  final mk = stexp.values
      .where((element) => element.Destination.contains(name))
      .toList();
  if (mk.isNotEmpty) {
    completestaylistnotifier.value.addAll(mk);
    completestaylistnotifier.notifyListeners();
  }
}

Future checkstay(String desname) async {
  funtwo.clear();
  intListtwo.clear();
  sumtwo = 0;

  final stexp = await Hive.openBox<stayexp>('stayexpence');

  final kf =
      stexp.values.where((element) => element.Destination == desname).toList();

  if (kf.isEmpty) {
    print("no same");
  } else {
    print("same found");
    List<int> intListtwo = kf.map((str) => int.parse(str.price)).toList();
    for (var i in kf) {
      funtwo.add(i.price);
    }
    intListtwo = funtwo.map((str) => int.parse(str)).toList();
    print(funtwo);
    for (int i = 0; i < intListtwo.length; i++) {
      sumtwo = sumtwo + intListtwo[i];
    }
    print(sumtwo);
  }
}

Future colourchange(String name) async {
  final favinst = await Hive.openBox<favoritetrip>('favtrip');
  bool ol = favinst.values.any((element) => element.destination == name);

  if (ol == true) {
    print("yes added");
    gun();
  } else {
    onegun();
    print("not added");
  }

//  var cj = favinst.values.firstWhere((element) => element.destination == name);
//  print(cj.destination);
//  gun();
}

Widget gun() {
  return const Text("added to fav",
      style: TextStyle(
        color: Colors.white,
      ));
}

Widget onegun() {
  return const Text(" not added fav",
      style: TextStyle(
        color: Colors.white,
      ));
}

Future datedisplayupcomingtrips(String stdate) async {
  displayongoingtrip();
  final instupcoming = await Hive.openBox<upcomingtrip>('trip');
  final jj = instupcoming.values
      .where((element) => element.startdate.contains(stdate))
      .toList();

  if (jj.isNotEmpty) {
    dateupcomingdisplaylistnotifier.value.clear();
    dateupcomingdisplaylistnotifier.value.addAll(jj);
    dateupcomingdisplaylistnotifier.notifyListeners();
  } else {
    print("soryyy");
  }
}

Future deletetripindividualy(String name) async {
  final ongoing = await Hive.openBox<imeongoing>('ongoingetails');

  // await instupcoming.delete(budget);
  // print("individualy deleted");
  final recordIndex = ongoing.values
      .toList()
      .indexWhere((element) => element.Destination == name);
  if (recordIndex != -1) {
    ongoing.deleteAt(recordIndex);
    print('Record with name $name deleted successfully');
  } else {
    print('Record with name $name not found');
  }
  ongoinglistnotifier.value.clear();

  ongoinglistnotifier.notifyListeners();

  await displayongoingtrip();
}

Future ome(String name) async {
  var pp = favouritetriplistnotifier.value.contains(name);

  if (pp == true) {
    print("the colour will be change");
  } else {
    print("nochnage");
  }
  print(pp.toString());
}
