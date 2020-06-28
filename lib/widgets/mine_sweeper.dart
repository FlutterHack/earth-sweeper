import 'package:earthsweeper/constants/values.dart';
import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/providers/mine_block_provider.dart';
import 'package:earthsweeper/providers/mine_sweeper_provider.dart';
import 'package:earthsweeper/widgets/lcd_panel.dart';
import 'package:earthsweeper/widgets/windows95/src/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mine_block.dart';


class MineSweeper extends StatelessWidget {
  final Game gameModel;

  const MineSweeper({Key key, @required this.gameModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    // Build notifier provider with game settings
    return ChangeNotifierProvider<MineSweeperProvider>(
      create: (BuildContext context) => MineSweeperProvider(gameModel),
      builder: (BuildContext context, Widget child) {
        MineSweeperProvider provider = Provider.of<MineSweeperProvider>(context);

        // Build mine providers
        provider.buildMineBlockProviders();

        // Simply build blocks from 2 dimensional points list
        return Elevation95(
          child: Container(
            padding: EdgeInsets.all(UI_MARGIN),
            child: Column(
              children: <Widget>[
                 Elevation95(
                   type: Elevation95Type.down,
                   child: Padding(
                     padding: EdgeInsets.all(UI_MARGIN),
                     child: Row(
                       mainAxisSize: MainAxisSize.max,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                        LCDPanel(text: provider.game.flagCount.toString() ?? "000", height: 30,),
                        Elevation95(
                          child: Image.asset("assets/happy.jpg", height: 30, fit: BoxFit.fill,),
                        ),
                        Selector<MineSweeperProvider, String>(
                          selector: (BuildContext , MineSweeperProvider provider ) => provider.counter.toString(),
                          builder: (BuildContext context, String value, Widget child) {
                            return LCDPanel(text: value ?? "00", height: 30,);
                          },
                        )
                      ],
                     ),
                   ),
                 ),
                 Container( // As margin
                   height: UI_MARGIN,
                 ),
                 Elevation95(
                  type: Elevation95Type.down,
                   child: Container(
                     width: screenwidth - UI_MARGIN * 2,
                     height: screenwidth - UI_MARGIN * 2,
                     child: Consumer<MineSweeperProvider>(
                      builder: (BuildContext context, MineSweeperProvider value, Widget child) {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: provider.points != null
                            ? provider.points.map((row){
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: row.map((block){
                                    return ChangeNotifierProvider<MineBlockProvider>(
                                      create: (BuildContext context) => block,
                                      builder: (c, v){
                                        return MineBlock();
                                      },
                                    );
                                  }).toList(),
                                );
                              }).toList()
                            : null
                          );
                      },
                  ),
                   ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}