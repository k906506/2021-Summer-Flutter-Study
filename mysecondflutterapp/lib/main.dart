import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Text('CHART!'),
            ),
            Card(
              child: Text('MESSAGE!'),
            ),
          ],
        ),
      ),
    );
  }
}
