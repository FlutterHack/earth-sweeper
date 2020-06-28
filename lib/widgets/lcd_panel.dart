import 'package:earthsweeper/widgets/windows95/flutter95.dart';
import 'package:flutter/material.dart';

class LCDPanel extends StatelessWidget {
  final String text;
  final double height;

  const LCDPanel({Key key, this.text, this.height}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Elevation95(
      type: Elevation95Type.down,
      child: Row(
        children: List.generate(text.length, (index) =>
            Image.asset(
              "assets/lcd_panel/${text[index]}.png",
              height: height,
              fit: BoxFit.fill,)),
      ),
    );
  }
}
