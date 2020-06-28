import 'package:earthsweeper/models/game.dart';
import 'package:flutter/material.dart';

class GameSettingsProvider extends ChangeNotifier {
  Game settings = Game(GameType.beginner, 9, 9, 10);

  changeSettings(GameType type, int width, int height, int mines) {
    settings.width = width;
    settings.height = height;
    settings.mineCount = mines;
    settings.type = type;

    notifyListeners();
  }
}
