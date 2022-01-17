import 'package:flutter/material.dart';

/*
class PwPage extends StatefulWidget {
  final String email;

  PwPage({required this.email});

  @override
  State<PwPage> createState() => _PwPageState();
}
*/

class PwPage extends StatelessWidget {
  final String email;

  PwPage({required this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: SizedBox(
            width: 300,
            height: 500,
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.grey, width: 1)),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Icon(
                            Icons.account_circle,
                            color: Colors.blue,
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Text(email),
                          Padding(padding: EdgeInsets.all(10)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.expand_more)),
                          Padding(padding: EdgeInsets.all(10)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
