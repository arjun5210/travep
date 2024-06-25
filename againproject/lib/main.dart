import 'package:againproject/completedtrip.dart';
import 'package:againproject/databaseongoing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:againproject/date.dart';
import 'package:againproject/datetest.dart';
import 'package:againproject/db/sample.dart';
import 'package:againproject/favorite.dart';
import 'package:againproject/foodprice.dart';
import 'package:againproject/foodselect.dart';
import 'package:againproject/image.dart';
import 'package:againproject/imediatelygoing.dart';
import 'package:againproject/listtestpage.dart';
import 'package:againproject/newdate.dart';
import 'package:againproject/one.dart';

import 'package:againproject/ongoingtrips.dart';
import 'package:againproject/screens/add_upcoming_screen.dart';
import 'package:againproject/screens/firstpage_screen.dart';
import 'package:againproject/screens/homepage_screen.dart';
import 'package:againproject/screens/testone.dart';
import 'package:againproject/screens/allselecting_screen.dart';

import 'package:againproject/search.dart';

import 'package:againproject/selectingpage.dart';
import 'package:againproject/splashongoing.dart';
import 'package:againproject/stayprice.dart';
import 'package:againproject/stayslectingpage.dart';
import 'package:againproject/travelmodeselect.dart';
import 'package:againproject/travelprice.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

const location = "god";
const savekey = "userloggedin";
String _stringValue = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCyId6zz-Xe3fa6tL1cNw1P44CgZrB9-hU",
        authDomain: "travep-6271e.firebaseapp.com",
        projectId: "travep-6271e",
        storageBucket: "travep-6271e.appspot.com",
        messagingSenderId: "224358824145",
        appId: "1:224358824145:web:ea6a915e936c7f0deaedf0"),
  );

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(maketripAdapter().typeId)) {
    Hive.registerAdapter(maketripAdapter());
  }
  if (!Hive.isAdapterRegistered(upcomingtripAdapter().typeId)) {
    Hive.registerAdapter(upcomingtripAdapter());
  }
  if (!Hive.isAdapterRegistered(favoritetripAdapter().typeId)) {
    Hive.registerAdapter(favoritetripAdapter());
  }
  if (!Hive.isAdapterRegistered(tripimagesAdapter().typeId)) {
    Hive.registerAdapter(tripimagesAdapter());
  }
  if (!Hive.isAdapterRegistered(foodAdapter().typeId)) {
    Hive.registerAdapter(foodAdapter());
  }
  if (!Hive.isAdapterRegistered(imeongoingAdapter().typeId)) {
    Hive.registerAdapter(imeongoingAdapter());
  }
  if (!Hive.isAdapterRegistered(travelexpAdapter().typeId)) {
    Hive.registerAdapter(travelexpAdapter());
  }
  if (!Hive.isAdapterRegistered(stayexpAdapter().typeId)) {
    Hive.registerAdapter(stayexpAdapter());
  }
  _loadStringValue();

  runApp(MyApp());
}

_loadStringValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  _stringValue = prefs.getString('myStringKey') ?? '';
}

_saveStringValue(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('myStringKey', value);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: testpage(),
      //testpage
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
