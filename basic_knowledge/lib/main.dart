import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() => runApp(MyApp());

//StatelessWidget은 화면에 변경이 적용될 수 없음
class MyApp extends StatelessWidget {
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
      home: helloPage('Hello World'));
  }
}

//화면을 하나씩 이렇게 불러오는 거임
//stful 입력해서 자동으로 생성, 상태를 갖을 수 있으며, UI변경이 가능
class helloPage extends StatefulWidget {
  final String title; ///아래 widget.title이 이거임


  helloPage(this.title);

  @override
  _helloPageState createState() => _helloPageState();
}

//여기서 내가 원하는 화면을 그려준다
class _helloPageState extends State<helloPage> {
  String _message = 'Hello World';
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: _changeMessage),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_message, style: TextStyle(fontSize: 30)),
                Text('$_counter', style: TextStyle(fontSize: 30)),
                //화면이동 버튼
                RaisedButton(
                  child: Text('화면 이동'),
                  onPressed: () {
                    //Navigator 사용시 화면 이동 후 돌아오는 버튼까지 생성
                    Navigator.push( //push는 화면이 위로 덮어지는거, pop은 아래로 빠지는거
                      context,
                      MaterialPageRoute(builder: (context) => cupertinoPage())
                    );
                  },
                )
              ],
            )
        ));
  }

  //setState UI를 변경하겠다, 다시 화면을 그린다는 얘기
  void _changeMessage() {
    setState(() {
      _message = '헬로 월드';
      _counter ++;
    });
  }
}
