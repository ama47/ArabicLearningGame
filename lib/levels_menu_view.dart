import 'package:flutter/material.dart';
import 'package:arabic_learning_game/level_view.dart';

// Leverl Menu
class LevelsMenuView extends StatelessWidget {
  const LevelsMenuView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* List<Widget> _getChildren(int count, String name) => List<Widget>.generate(
          count,
          (i) => ListTile(
            title: Text(
              '$name ${i + 1}',
              textAlign: TextAlign.right,
            ),
            enabled: false,
          ),
        ); */

    return Scaffold(
        backgroundColor: Color(0xFFD4ECEC),
        appBar: AppBar(
          title: Text(
            ('عالم 1'),
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Scrollbar(
                child: ListView(
          children: [
            ExpansionTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'مرحلة 1',
                  textAlign: TextAlign.right,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'جزء 1',
                      textAlign: TextAlign.right,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LevelView()));
                    },
                  )
                ]),
            ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'مرحلة 2',
                textAlign: TextAlign.right,
              ),
              children: [
                ListTile(
                  title: Text(
                    'جزء 1',
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            )
          ],
        ))));
  }
}
