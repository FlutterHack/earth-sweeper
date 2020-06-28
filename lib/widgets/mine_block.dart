import 'package:earthsweeper/constants/values.dart';
import 'package:earthsweeper/controllers/mine_block_controller.dart';
import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/providers/mine_sweeper_provider.dart';
import 'package:earthsweeper/widgets/windows95/flutter95.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MineBlock extends StatefulWidget{
  final double blockDiemension;
  final MineBlockController blockController;

  const MineBlock({Key key, this.blockDiemension, this.blockController}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MineBlock();
  }
}

class _MineBlock extends State<MineBlock> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.blockController.registerState(this);

    return !widget.blockController.opened
            ? GestureDetector(
              onTapDown: (details){
                if(!widget.blockController.disabled){
                  widget.blockController.tabbed = true;
                  Provider.of<MineSweeperProvider>(context, listen: false).excitement = true;
                }
              },
              onTapUp: (details){
                if(!widget.blockController.disabled){
                  widget.blockController.tabbed = false;
                  Provider.of<MineSweeperProvider>(context, listen: false).excitement = false;
                  Provider.of<MineSweeperProvider>(context, listen: false).blockClick(widget.blockController);
                }
              },
              onDoubleTap: (){
                if(!widget.blockController.disabled){
                  widget.blockController.flagged = !widget.blockController.flagged;
                  widget.blockController.tabbed = false;

                  Provider.of<MineSweeperProvider>(context, listen: false).excitement = false;
                  Provider.of<MineSweeperProvider>(context, listen: false).decreaseFlagCount();
                }
              },
              child: Container(
                width: widget.blockDiemension,
                height: widget.blockDiemension,
                decoration: widget.blockController.tabbed
                    ? Flutter95.pressedDecorationOutside
                    : Flutter95.elevatedDecorationOutside,
                child: Container(
                  decoration: widget.blockController.tabbed
                      ? Flutter95.pressedDecoration
                      : Flutter95.elevatedDecoration,
                  child: widget.blockController.flagged
                      ? Padding(
                    padding: EdgeInsets.all(widget.blockDiemension / 6),
                    child: Image.asset("assets/mine_block/flag.png",
                        height: widget.blockDiemension,
                        width: widget.blockDiemension,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.none),
                  )
                      : null,
                ),
              ),
            )
            : Container(
              height: widget.blockDiemension,
              width: widget.blockDiemension,
              decoration: Flutter95.pressedDecoration,
              child: Image.asset(widget.blockController.blockAsset ?? "",
                  height: widget.blockDiemension,
                  width: widget.blockDiemension,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.none),
        );
  }
}
