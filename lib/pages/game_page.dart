import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/providers/game_settings_provider.dart';
import 'package:earthsweeper/widgets/mine_sweeper.dart';
import 'package:earthsweeper/widgets/windows95/src/scaffold95.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold95(
      title: "Game",
      body: Container(
          child: MineSweeper(
        gameModel:
            Provider.of<GameSettingsProvider>(context, listen: false).settings,
      )),
    ));
  }
}
