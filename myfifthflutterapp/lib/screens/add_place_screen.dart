import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("새로운 장소 추가"),
      ),
      body: Column(
        children: <Widget>[
          Text("유저 인풋"),
          RaisedButton.icon(
              icon: Icon(Icons.add), label: Text("장소 추가"), onPressed: () {}),
        ],
      ),
    );
  }
}
