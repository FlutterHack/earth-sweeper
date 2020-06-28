import 'package:earthsweeper/constants/values.dart';
import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/controllers/mine_block_controller.dart';
import 'package:earthsweeper/providers/mine_sweeper_provider.dart';
import 'package:earthsweeper/widgets/lcd_panel.dart';
import 'package:earthsweeper/widgets/windows95/src/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mine_block.dart';

class MineSweeper extends StatelessWidget {
  final Game gameModel;

  const MineSweeper({Key key, @required this.gameModel});

  @override
  Widget build(BuildContext context) {
    // Actual width of screen, will help us determining area diemensions
    double screenWidth = MediaQuery.of(context).size.width - 4.0;

    // Build notifier provider with game settings
    return ChangeNotifierProvider<MineSweeperProvider>(
      create: (BuildContext context) => MineSweeperProvider(gameModel),
      builder: (BuildContext context, Widget child) {
        // The provider
        MineSweeperProvider provider =
            Provider.of<MineSweeperProvider>(context);

        // Build mine block providers
        provider.buildMineBlockControllers();

        // There are 4 borders between screen borders, extract them from width
        double areaWidth =
            screenWidth - UI_MARGIN * 2 - UI_BORDER_THICKNESS * 4;
        double areaHeight =
            (areaWidth / provider.points.length) * provider.points[0].length;
        double blockDimension = (areaWidth / provider.points.length);

        // Simply build blocks from 2 dimensional points list
        return Expanded(
          child: Elevation95(
            child: Container(
              padding: EdgeInsets.all(UI_MARGIN),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // TOP BAR
                  Elevation95(
                    type: Elevation95Type.down,
                    child: Padding(
                      padding: EdgeInsets.all(UI_MARGIN),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LCDPanel(
                            number: provider.game.flagCount ?? 0,
                            length: 2,
                            height: 30,
                          ),
                          Elevation95(
                            child: Image.asset(
                              provider.currentMoodAsset,
                              height: 30,
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.none,
                            ),
                          ),
                          Selector<MineSweeperProvider, int>(
                            selector:
                                (BuildContext, MineSweeperProvider provider) =>
                                    provider.counter,
                            builder: (BuildContext context, int value,
                                Widget child) {
                              return LCDPanel(
                                number: value ?? 0,
                                height: 30,
                                length: 3,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // As margin
                    height: UI_MARGIN,
                  ),
                  // MINE FIELD
                  Expanded(
                    child: Center(
                      child: Elevation95(
                        type: Elevation95Type.down,
                        child: SingleChildScrollView(
                          child: Container(
                            width: areaWidth,
                            height: areaHeight,
                            child: Consumer<MineSweeperProvider>(
                              builder: (BuildContext context,
                                  MineSweeperProvider value, Widget child) {
                                return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: provider.points != null
                                        ? provider.points.map((row) {
                                            // Map all points to mine blocks
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: row.map((blockProvider) {
                                                return MineBlock(
                                                  blockDiemension: blockDimension,
                                                  blockController: blockProvider,
                                                );
                                              }).toList(),
                                            );
                                          }).toList()
                                        : null);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // GAME CONTROLLER
                  Row(
                    children: <Widget>[
                      // SPECIAL FEATURES
                      Container(),
                      // CONTROLLER
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
