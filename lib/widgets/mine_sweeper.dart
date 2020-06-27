import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/providers/mine_block_provider.dart';
import 'package:earthsweeper/providers/mine_sweeper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mine_block.dart';


class MineSweeper extends StatelessWidget {
  final Game gameModel;

  const MineSweeper({Key key, @required this.gameModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build notifier provider with game settings
    return ChangeNotifierProvider<MineSweeperProvider>(
      create: (BuildContext context) => MineSweeperProvider(gameModel),
      builder: (BuildContext context, Widget child) {
        MineSweeperProvider provider = Provider.of<MineSweeperProvider>(context);

        // Build mine providers
        provider.buildMineBlockProviders();

        // Simply build blocks from 2 dimensional points list and register tabbed
        return Consumer<MineSweeperProvider>(
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
        );
      },
    );
  }
}