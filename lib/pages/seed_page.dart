import 'package:earthsweeper/constants/values.dart';
import 'package:earthsweeper/providers/seed_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/windows95/flutter95.dart';

class SeedPage extends StatefulWidget {
  @override
  _SeedPageState createState() => _SeedPageState();
}

class _SeedPageState extends State<SeedPage> {
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    var seedModel = Provider.of<SeedProvider>(context);

    return SafeArea(
        child: Scaffold95(
            title: 'Seeds',
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(UI_MARGIN),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${seedModel.seeds} Seeds",
                              style: Flutter95.textStyle),
                          Image.asset(
                            'assets/seed.png',
                            width: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(UI_MARGIN),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Watch Ad to earn 100 Seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            height: UI_SECONDARY_BUTTON_HEIGHT,
                            width: UI_SECONDARY_BUTTON_WIDTH,
                            onTap: () {
                              seedModel.increase(100);
                              setState(() {
                                errorText = "";
                              });
                            },
                            child: Text("Watch"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(UI_MARGIN),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Purchase 500 seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            height: UI_SECONDARY_BUTTON_HEIGHT,
                            width: UI_SECONDARY_BUTTON_WIDTH,
                            onTap: () {
                              seedModel.increase(500);
                              setState(() {
                                errorText = "";
                              });
                            },
                            child: Text("\$ 1"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(UI_MARGIN),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Purchase 1500 Seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            height: UI_SECONDARY_BUTTON_HEIGHT,
                            width: UI_SECONDARY_BUTTON_WIDTH,
                            onTap: () {
                              seedModel.increase(1500);
                              setState(() {
                                errorText = "";
                              });
                            },
                            child: Text("\$ 2"),
                          )
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       Text("Purchase 1500 Seeds",
                    //           style: Flutter95.textStyle),
                    //       Button95(
                    //         onTap: () {},
                    //         child: Text("\$ 2"),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.all(UI_MARGIN),
                      child: Elevation95(
                        type: Elevation95Type.down,
                        child: Padding(
                          padding: const EdgeInsets.all(UI_MARGIN),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/plant_tree.png',
                                  height: 200,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(UI_MARGIN),
                                  child: Text("Plant a Tree for 2000 seeds",
                                      style: Flutter95.textStyle),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(UI_MARGIN),
                                  child: Button95(
                                    height: UI_PRIMARY_BUTTON_HEIGHT,
                                    width: UI_PRIMARY_BUTTON_WIDTH,
                                    child: Text("Plant"),
                                    onTap: () {
                                      if (seedModel.isEnoughSeed(2000)) {
                                        setState(() {
                                          errorText = "";
                                        });
                                        seedModel.decrease(2000);
                                      } else {
                                        setState(() {
                                          errorText = "Not Enough Seeds";
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (errorText.isNotEmpty)
                      Center(
                          child: Text(errorText, style: Flutter95.textStyle)),
                  ],
                ),
              ),
            )));
  }
}
