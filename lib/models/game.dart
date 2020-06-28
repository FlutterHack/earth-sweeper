import 'dart:math';

import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/providers/game_settings_provider.dart';
import 'package:flutter/cupertino.dart';

enum GameType { beginner, intermediate, expert, custom }
enum GameState {idle, playing, excited, died, winner}

class Game {
  int height;
  int width;
  int mineCount;
  int duration;
  int flagCount;

  GameState state;
  GameType type;

  // All points
  List<List<MinePoint>> points;

  // Placed mines
  List<MinePoint> mines;

  Game({@required this.type, @required this.height, @required this.width, @required this.mineCount, this.duration = 0, this.flagCount = 99, this.state = GameState.idle}) {
    points = [];
    mines = [];

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

    // Put that point to mines list, to access it later easily
    mines.add(points[randomX][randomY]);

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
