import 'package:flutter/material.dart';

// Leverl Menu
class LevelView extends StatelessWidget {
  const LevelView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF40B4B7),
        textStyle: const TextStyle(fontSize: 40),
        fixedSize: Size(224, 77));

    return Scaffold(
        backgroundColor: Color(0xFFD4ECEC),
        appBar: AppBar(
          title: Text(
            ('مرحلة 1 - جزئية 1'),
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'سؤال؟',
                style: TextStyle(fontSize: 32),
              ),
              Container(
                child: FlutterLogo(
                  size: 150,
                ),
              ),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('التالي'),
              ),
            ],
          ),
        )));
  }
}
