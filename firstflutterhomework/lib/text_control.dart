import 'package:flutter/material.dart';
import './text_output.dart';

class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _text = "If you click this button";
  var changed = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            if (changed == 0) {
              setState(() {
                _text = "change this context!";
                changed = 1;
              });
            } else {
              setState(() {
                _text = "exchange this context!";
                changed = 0;
              });
            }
          },
          child: Text('Click'),
        ),
        TextOutput(_text),
      ],
    );
  }
}
