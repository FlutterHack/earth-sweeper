import 'dart:math';

import 'package:earthsweeper/models/game.dart';
import 'package:flutter/material.dart';

class GameSettingsProvider extends ChangeNotifier {
  Game settings = Game(
    type: GameType.custom,
    width: 10,
    height: 10,
    mineCount: 10,
  );

  changeSettings(GameType type, int width, int height, int mines) {
    settings = Game(type: type, width: width, height: height, mineCount: mines);

    notifyListeners();
  }
}
