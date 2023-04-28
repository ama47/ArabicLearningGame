import 'package:arabic_learning_game/views/worlds_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:arabic_learning_game/views/settings_dialog.dart';
import 'package:sqflite/sqflite.dart';
import 'package:arabic_learning_game/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF40B4B7),
        textStyle: const TextStyle(fontSize: 40),
        fixedSize: Size(224, 77));
    void _openSettingsDialog() {
      Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return SettingsDialog();
          },
          fullscreenDialog: true));
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xFFD4ECEC),
      body: SafeArea(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 10,
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: () async {
                      await databaseService.getImageInfo(5);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WorldsMenuView()));
                    },
                    child: const Text('ابدأ'),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      _openSettingsDialog();
                    },
                    child: const Text('خيارات'),
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: const Text('عن اللعبة'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}