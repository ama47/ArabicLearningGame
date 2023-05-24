import 'package:arabic_learning_game/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsDialog extends StatefulWidget {
  @override
  SettingsDialogState createState() => new SettingsDialogState();
}

class SettingsDialogState extends State<SettingsDialog> {
  void resetGame() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('worldCount', 110);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD4ECEC),
        appBar: AppBar(
          title: const Text(
            'خيارات',
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  //TODO: Handle save
                },
                child: Text(
                  'حفظ',
                )),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text('إعادة اللعبة'),
              onPressed: (() {
                resetGame();
              }),
            ),
            ElevatedButton(
              child: Text('مسح الصور المحددة'),
              onPressed: (() {
                databaseService.deleteSelectedImages();
              }),
            )
          ],
        )));
  }
}
