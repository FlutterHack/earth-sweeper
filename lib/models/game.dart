import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/providers/game_settings_provider.dart';

enum GameType { beginner, intermediate, expert, custom }

class Game {
  int height;
  int width;
  int mineCount;
  int duration;
  int flagCount;

  GameType type;

  List<List<MinePoint>> points;

  Game(this.type, this.height, this.width, this.mineCount, {this.duration = 60, this.flagCount = 99}) {
    points = [];
    // Build points and mines
    // TODO: Move this block to async
    for (int x = 0; x < width; x++) {
      points.add([]);
      for (int y = 0; y < height; y++) {
        points[x].add(MinePoint(x, y, "", false, 2)); // Test values, TODO: Implement builder mechanism
      }
    }
  }
}
