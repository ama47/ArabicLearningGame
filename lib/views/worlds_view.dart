import 'package:flutter/material.dart';
import 'package:arabic_learning_game/views/levels/level_one_view.dart';

// Worlds menu view
class WorldsView extends StatefulWidget {
  const WorldsView({super.key});

  @override
  State<WorldsView> createState() => _WorldsViewState();
}

class _WorldsViewState extends State<WorldsView> {
  int _worldCount = 1, _levelCount = 1;

  @override
  Widget build(BuildContext context) {
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
              WorldContainer(
                text: 'العالم الأول',
              ),
              WorldContainer(
                text: 'العالم الثاني',
              ),
              WorldContainer(
                text: 'العالم الثالث',
              ),
            ],
          )),
        ));
  }
}

class LevelButton extends StatefulWidget {
  final int levelNum;
  const LevelButton({Key? key, this.levelNum = 0}) : super(key: key);

  @override
  _LevelButtonState createState() => _LevelButtonState();
}

class _LevelButtonState extends State<LevelButton> {
  bool _isEnabled = true;

  void _toggleButton() {
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isEnabled
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LevelOneView()));
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: _isEnabled ? Colors.green : Colors.grey,
      ),
      child: Text('${widget.levelNum}'),
    );
  }
}

class WorldContainer extends StatefulWidget {
  final int worldNum;
  final String text;
  const WorldContainer({Key? key, this.worldNum = 0, this.text = 'null'})
      : super(key: key);

  @override
  _WorldContainerState createState() => _WorldContainerState();
}

class _WorldContainerState extends State<WorldContainer> {
  bool _isEnabled = false;
  TextStyle _textStyle = TextStyle(fontSize: 30);
  ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      textStyle: const TextStyle(color: Colors.black, fontSize: 40),
      fixedSize: Size(224, 77));
  BoxDecoration _containerDecoration = BoxDecoration(
    border: Border.all(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _containerDecoration,
      child: Column(
        children: [
          Text(
            widget.text,
            style: _textStyle,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LevelButton(
                  levelNum: 1,
                ),
                LevelButton(
                  levelNum: 2,
                ),
                LevelButton(
                  levelNum: 3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
