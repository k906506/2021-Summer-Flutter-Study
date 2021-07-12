import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget{
  final String _text;

  TextOutput(this._text);

  @override
  Widget build(BuildContext context){
    return Text(_text);
  }
}