//Android UI
import 'package:flutter/material.dart';
//IOS UI
import 'package:flutter/cupertino.dart';

class cupertinoPage extends StatefulWidget {

  @override
  _cupertinoPageState createState() => _cupertinoPageState();
}

class _cupertinoPageState extends State<cupertinoPage> {
  bool _switch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //IOS UI
      appBar: CupertinoNavigationBar(
        middle: Text('쿠퍼티노 UI'),
      ),
      body: Column(
        children: <Widget>[
          CupertinoButton(
            onPressed: () {  },
            child: Text('쿠퍼티노 버튼'),
          ),
          CupertinoSwitch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            },
          ),
          // Android UI
          RaisedButton(
            child: Text('머터리얼 버튼'),
          ),
          Switch(
            value: _switch,
            onChanged: (bool value) {
              setState(() {
                _switch = value;
              });
            },
          )
        ],
      ),
    );
  }
}
