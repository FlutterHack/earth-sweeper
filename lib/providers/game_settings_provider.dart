import 'dart:math';

import 'package:earthsweeper/models/game.dart';
import 'package:flutter/material.dart';

class GameSettingsProvider extends ChangeNotifier {
  GameType _type = GameType.beginner;
  int _width = 9;
  int _height = 9;
  int _mines = 10;

  GameType get type => _type;
  int get width => _width;
  int get height => _height;
  int get mines => _mines;

  void changeSettings(GameType type, int width, int height, int mines) {
    _type = type;
    _width = width;
    _height = height;
    _mines = mines;

    notifyListeners();
  }

  Game buildGame(){
    return Game(type: _type, height: _height, width: _width, mineCount: _mines);
  }
}
