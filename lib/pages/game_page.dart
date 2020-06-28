import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/widgets/mine_sweeper.dart';
import 'package:earthsweeper/widgets/windows95/src/scaffold95.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold95(
          title: "Game",
          body: Container(
            child: MineSweeper(
            gameModel: Game(
              type: GameType.custom,
              width: 10,
              height: 10,
              mineCount: 10,
            ),
        )),
      ));
  }
}
