import 'package:earthsweeper/constants/values.dart';
import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/providers/mine_block_provider.dart';
import 'package:earthsweeper/widgets/windows95/flutter95.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MineBlock extends StatelessWidget {
  final double blockDiemension;

  const MineBlock({Key key, this.blockDiemension = MINE_POINT_DIMENSION}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MineBlockProvider>(
      builder: (BuildContext context, MineBlockProvider provider, Widget child) {
        return !provider.opened
            ? Container(
              width: blockDiemension,
              height: blockDiemension,
              decoration: provider.tabbed
                  ? Flutter95.pressedDecorationOutside
                  : Flutter95.elevatedDecorationOutside,
              child: Container(
                decoration: provider.tabbed
                    ? Flutter95.pressedDecoration
                    : Flutter95.elevatedDecoration,
                  ),
                )
            : Container(
                height: MINE_POINT_DIMENSION,
                width: MINE_POINT_DIMENSION,
                decoration: Flutter95.pressedDecoration,
                child: Image.asset(provider.blockAsset ?? "",
                  height: blockDiemension,
                  width: blockDiemension,
                  fit: BoxFit.fill,
                filterQuality: FilterQuality.none),
              );
      },
    );
  }
}
