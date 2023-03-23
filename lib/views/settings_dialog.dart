import 'package:flutter/material.dart';

class SettingsDialog extends StatefulWidget {
  @override
  SettingsDialogState createState() => new SettingsDialogState();
}

class SettingsDialogState extends State<SettingsDialog> {
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
      body: Text("Foo"),
    );
  }
}
