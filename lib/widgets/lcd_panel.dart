import 'package:earthsweeper/widgets/windows95/flutter95.dart';
import 'package:flutter/material.dart';

class LCDPanel extends StatelessWidget {
  final int number;
  final double height;

  final length;

  const LCDPanel({Key key, this.number, this.height, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Elevation95(
      type: Elevation95Type.down,
      child: Stack(
        children: [
          Row(
            children: List.generate(length, (index) =>
                Image.asset(
                  "assets/lcd_panel/-.png",
                  height: height,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.none,)),
          ),
          Row(
            children: List.generate(length, (index) =>
                Image.asset(
                  "assets/lcd_panel/${number.toString().padLeft(length, "0")[index]}.png",
                  height: height,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.none,)),
          ),
        ]
      ),
    );
  }
}
