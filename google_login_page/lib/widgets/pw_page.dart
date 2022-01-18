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

  const PwPage({required this.email});

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
                    width: 321,
                    height: 40,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: const BorderSide(color: Colors.grey, width: 1)),
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          const Icon(
                            Icons.account_circle,
                            color: Colors.blue,
                          ),
                          const Padding(padding: EdgeInsets.all(5)),
                          Text(email),
                          //const Padding(padding: EdgeInsets.all(5)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.expand_more)),
                          const Padding(padding: EdgeInsets.all(1)),
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
