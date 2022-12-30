import 'package:flutter/material.dart';

// Worlds menu view
class WorldsMenuView extends StatelessWidget {
  const WorldsMenuView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        textStyle: const TextStyle(color: Colors.black, fontSize: 40),
        fixedSize: Size(224, 77));
    return Scaffold(
        backgroundColor: Color(0xFFD4ECEC),
        appBar: AppBar(
          title: Text(
            'قائمة العوالم',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 10,
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text('العالم الأول'),
                ),
              ),
              Flexible(
                flex: 5,
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text('العالم الثاني'),
                ),
              ),
              Flexible(
                flex: 10,
                child: ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text('العالم الثالث'),
                ),
              ),
            ],
          )),
        ));
  }
}
