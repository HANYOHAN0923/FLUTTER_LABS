import 'package:flutter/material.dart';
import 'package:task1_textchanger/main.dart';

class MainText extends StatefulWidget {
  @override
  _MainTextState createState() => _MainTextState();
}

class _MainTextState extends State<MainText> {
  String _mainText = 'Hello World';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_mainText),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _mainText = 'Changed';
              });
            },
            child: Text('Change'),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue, onPrimary: Colors.white)),
      ],
    );
  }
}
