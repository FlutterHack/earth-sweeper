import 'package:earthsweeper/widgets/windows95/src/utils.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class TextField95 extends StatefulWidget {
  const TextField95({Key key, this.controller, this.inputType, this.maxLength})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType inputType;
  final int maxLength;

  @override
  _TextField95State createState() => _TextField95State();
}

class _TextField95State extends State<TextField95> {
  @override
  Widget build(BuildContext context) {
    return Elevation95(
      type: Elevation95Type.down,
      child: Container(
        padding: EdgeInsets.all(4.0),
        color: Flutter95.white,
        height: 32,
        child: Material(
          color: Flutter95.white,
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.inputType,
            maxLength: widget.maxLength,
            buildCounter: (BuildContext context,
                    {int currentLength, int maxLength, bool isFocused}) =>
                null,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
            ),
            cursorColor: Flutter95.black,
            style: Flutter95.textStyle,
          ),
        ),
      ),
    );
  }
}
