import 'package:flutter/material.dart';

import 'Widgets/login_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Google Login Widget',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Google Login Widget'),
          ),
          body: _buildBody(),
        ));
  }

  Widget _buildBody() {
    return Center(
      child: LoginCard(),
    );
  }
}
