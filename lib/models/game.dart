import 'dart:math';

import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/providers/game_settings_provider.dart';
import 'package:flutter/cupertino.dart';

enum GameType { beginner, intermediate, expert, custom }

class Game {
  int height;
  int width;
  int mineCount;
  int duration;
  int flagCount;

  GameType type;

  List<List<MinePoint>> points;

  Game({@required this.type, @required this.height, @required this.width, @required this.mineCount, this.duration = 60, this.flagCount = 99}) {
    points = [];
    // Build points and mines
    // TODO: Move this block to async
    for (int x = 0; x < width; x++) {
      points.add([]);
      for (int y = 0; y < height; y++) {
        points[x].add(MinePoint(x, y)); // Build points
      }
    }

    print(points[4][1].nearbyCount);

    // Took random mineCount times point and mine them
    int placedMine = 0;
    while(placedMine != mineCount){
      int randomX = (Random().nextDouble() * width).floor();
      int randomY = (Random().nextDouble() * height).floor();

      if(!points[randomX][randomY].mined){
        // Place mines
        placeMine(randomX, randomY);
        placedMine++;
      }
    }
  }

  void placeMine(int randomX, int randomY){
    points[randomX][randomY].mined = true;

    // Increase nearby point's nearbyCount // That will save processing power
    increaseNearbyCount(randomX - 1, randomY); // West
    increaseNearbyCount(randomX - 1, randomY - 1); // North West
    increaseNearbyCount(randomX, randomY - 1); // North
    increaseNearbyCount(randomX + 1, randomY - 1); // North East
    increaseNearbyCount(randomX + 1, randomY); // East
    increaseNearbyCount(randomX + 1, randomY + 1); // South East
    increaseNearbyCount(randomX, randomY + 1); // South
    increaseNearbyCount(randomX - 1, randomY + 1); // South West
  }

  bool increaseNearbyCount(x, y){
    if((x >= 0 && x < width) && (y >= 0 && y < height)){
      points[x][y].increaseNearbyCount();
    }
  }
}
