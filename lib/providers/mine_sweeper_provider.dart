import 'dart:async';

import 'package:earthsweeper/constants/values.dart';
import 'package:earthsweeper/constants/win95_page_transition.dart';
import 'package:earthsweeper/main.dart';
import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/models/mine_point.dart';
import 'package:earthsweeper/pages/login_page.dart';
import 'package:earthsweeper/providers/seed_provider.dart';
import 'package:earthsweeper/widgets/windows95/flutter95.dart';
import 'package:earthsweeper/widgets/windows95/src/alert95.dart';
import 'package:earthsweeper/widgets/windows95/src/alert95/alert_style.dart';
import 'package:earthsweeper/widgets/windows95/src/alert95/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/mine_block_controller.dart';

enum SweeperControl { left, up, right, down }

class MineSweeperProvider extends ChangeNotifier {
  final Game game;
  Timer timer;

  int _counter;

  List<List<MineBlockController>> points;

  String get currentMoodAsset {
    if (game == null) return "assets/happy.png";

    if (game.state == GameState.idle || game.state == GameState.playing) {
      return "assets/happy.png";
    } else if (game.state == GameState.excited) {
      return "assets/excited.png";
    } else if (game.state == GameState.died) {
      return "assets/died.png";
    } else if (game.state == GameState.winner) {
      return "assets/winner.png";
    } else {
      return "assets/happy.png";
    }
  }

  int get counter => _counter;
  set counter(i) {
    _counter = i;
    game.duration = _counter;
    notifyListeners();
  }

  set excitement(bool excite) {
    game.state = excite ? GameState.excited : GameState.playing;
    notifyListeners();
  }

  MineSweeperProvider(this.game) {
    // Set initial timer
    _counter = game.duration;
  }

  void buildMineBlockControllers() {
    if (points != null) return;

    points = [];

    // Build MineBlockProviders
    for (int x = 0; x < game.width; x++) {
      points.add([]);
      for (int y = 0; y < game.height; y++) {
        points[x].add(MineBlockController(game.points[x][y]));
      }
    }
  }

  void blockClick(MineBlockController mineBlock, BuildContext context) {
    checkAndStartGame();

    // Set excitement false
    excitement = false;

    // Check clicked point if its mined than finish game
    // If its nearest point greater than 0 only show him
    // If its nearest point equals to 0 than search all nearest fields
    if (mineBlock.pointData.mined && !mineBlock.flagged) {
      // Stop timer
      timer.cancel();

      // Expose field
      exposeFieldAndFinish();

      // Set users clicked point as exploded
      mineBlock.exploded = true;

      // Set state
      game.state = GameState.died;
    } else if (mineBlock.pointData.nearbyCount > 0 && !mineBlock.flagged) {
      mineBlock.opened = true;
    } else if (mineBlock.pointData.nearbyCount == 0) {
      // Apply walk method to open all nonmined block
      openBlock(mineBlock.pointData.x, mineBlock.pointData.y,
          allowPassThoughNumber: true);
    }

    // Check win state of the game
    if (checkWinState()) {
      // Set state
      game.state = GameState.winner; // You win !!!

      showAlertDialog(context);
      Provider.of<SeedProvider>(context, listen: false)
          .increase(game.mineCount);

      flagFieldAndFinish();
    }
  }

  void decreaseFlagCount() {
    checkAndStartGame();

    game.flagCount--;
    notifyListeners();
  }

  bool checkWinState() {
    bool checkBlockOpened(int x, int y) {
      if ((x >= 0 && x < game.width) && (y >= 0 && y < game.height)) {
        return points[x][y].opened;
      } else {
        return true;
      }
    }

    for (MinePoint point in game.mines) {
      if (!checkBlockOpened(point.x - 1, point.y)) // West
        return false;

      if (!checkBlockOpened(point.x - 1, point.y - 1)) // North West
        return false;

      if (!checkBlockOpened(point.x, point.y - 1)) // North
        return false;

      if (!checkBlockOpened(point.x + 1, point.y - 1)) // North East
        return false;

      if (!checkBlockOpened(point.x + 1, point.y)) // East
        return false;

      if (!checkBlockOpened(point.x + 1, point.y + 1)) // South East
        return false;

      if (!checkBlockOpened(point.x, point.y + 1)) // South
        return false;

      if (!checkBlockOpened(point.x - 1, point.y + 1)) // South West
        return false;
    }
    print('WON GAME TRUE');
    return true;
  }

  void checkAndStartGame() {
    // Start timer if it didn't started yet
    if (timer == null) {
      timer = Timer.periodic(Duration(seconds: 1), (t) {
        counter++;
      });

      game.state = GameState.playing;
    }
  }

  // Opens block and check neighborhoods
  void openBlock(int x, int y, {bool allowPassThoughNumber = false}) {
    if ((x >= 0 && x < game.width) &&
        (y >= 0 && y < game.height) &&
        !points[x][y].pointData.mined &&
        !points[x][y].flagged &&
        !points[x][y].opened) {
      MineBlockController point = points[x][y];

      if ((allowPassThoughNumber && point.pointData.nearbyCount > 0) ||
          point.pointData.nearbyCount == 0) {
        point.opened = true;

        // open all neiberhood blocks
        openBlock(x - 1, y,
            allowPassThoughNumber: point.pointData.nearbyCount == 0); // West
        openBlock(x - 1, y - 1,
            allowPassThoughNumber:
                point.pointData.nearbyCount == 0); // North West
        openBlock(x, y - 1,
            allowPassThoughNumber: point.pointData.nearbyCount == 0); // North
        openBlock(x + 1, y - 1,
            allowPassThoughNumber:
                point.pointData.nearbyCount == 0); // North East
        openBlock(x + 1, y,
            allowPassThoughNumber: point.pointData.nearbyCount == 0); // East
        openBlock(x + 1, y + 1,
            allowPassThoughNumber:
                point.pointData.nearbyCount == 0); // South East
        openBlock(x, y + 1,
            allowPassThoughNumber: point.pointData.nearbyCount == 0); // South
        openBlock(x - 1, y + 1,
            allowPassThoughNumber:
                point.pointData.nearbyCount == 0); // South West
      }
    }
  }

  // Finish game for the blocks
  void exposeFieldAndFinish() {
    for (int x = 0; x < game.width; x++) {
      for (int y = 0; y < game.height; y++) {
        MineBlockController block = points[x][y];

        if (!block.flagged && block.pointData.mined) {
          block.opened = true;
        }

        block.disabled = true;
      }
    }
  }

  // Finish game for the blocks
  void flagFieldAndFinish() {
    print('Flag and Finish');
    for (int x = 0; x < game.width; x++) {
      for (int y = 0; y < game.height; y++) {
        MineBlockController block = points[x][y];

        if (!block.flagged && block.pointData.mined) {
          block.flagged = true;
          block.exposed = true;
        }

        block.disabled = true;
      }
    }
  }

  void showAlertDialog(BuildContext context) {
    Alert95(
      style: AlertStyle(isCloseButton: false),
      title: 'Congratulations!',
      image: Image.asset('assets/winner.png'),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("You won ${game.mineCount}", style: Flutter95.textStyle),
            Image.asset(
              'assets/seed.png',
              width: 25,
            )
          ],
        ),
      ),
      buttons: [
        Button95(
          height: UI_SECONDARY_BUTTON_HEIGHT,
          width: UI_SECONDARY_BUTTON_WIDTH,
          child: Text("Home"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        )
      ],
      closeFunction: () {
        print('Closing');
        Navigator.of(context)
            .pushReplacement(Win95Transition(widget: MyHomePage()));
      },
      context: context,
    ).show();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
