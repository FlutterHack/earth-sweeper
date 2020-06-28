import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/models/mine_point.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mine_block_provider.dart';


enum SweeperControl{
  left, up, right, down
}

class MineSweeperProvider extends ChangeNotifier{
  final Game game;
  int _counter;

  List<List<MineBlockProvider>> points;

  String get currentMoodAsset => "assets/happy.jpeg"; // TODO: Implement win lose logic

  int get counter => _counter;
  set counter(i){
    counter = i;
    game.duration = _counter;
    notifyListeners();
  }

  MineSweeperProvider(this.game){
    // Set initial timer
    _counter = game.duration;
  }

  Future<List<List<MineBlockProvider>>> buildMineBlockProviders() async{
    points = [];

    // Build MineBlockProviders
    for(int x = 0; x < game.width; x++){
      points.add([]);
      for(int y = 0; y < game.width; y++){
        points[x].add(MineBlockProvider(game.points[x][y]));
      }
    }

    // Wait for build finish, TODO: Implement correct waiting for build
    await Future.delayed(Duration(milliseconds: 100));

    // Notify sweeper area
    notifyListeners();
  }
}