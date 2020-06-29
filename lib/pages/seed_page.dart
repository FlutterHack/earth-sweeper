import 'package:earthsweeper/constants/values.dart';
import 'package:earthsweeper/providers/seed_provider.dart';
import 'package:earthsweeper/widgets/windows95/src/alert95.dart';
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
                          Text("Watch Ad to earn $AD_PURCHASE Seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            height: UI_SECONDARY_BUTTON_HEIGHT,
                            width: UI_SECONDARY_BUTTON_WIDTH,
                            onTap: () {
                              Alert95(
                                  context: context,
                                  title: 'AD',
                                  buttons: [
                                    Button95(
                                      width: UI_SECONDARY_BUTTON_WIDTH + 30,
                                      height: UI_SECONDARY_BUTTON_HEIGHT,
                                      child: Text("Earn $AD_PURCHASE Seeds"),
                                      onTap: () {
                                        seedModel.increase(AD_PURCHASE);
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                  content: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text("This is an annoying Ad!",
                                        style: Flutter95.textStyle),
                                  )).show();
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
                          Text("Purchase $SMALL_PURCHASE seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            height: UI_SECONDARY_BUTTON_HEIGHT,
                            width: UI_SECONDARY_BUTTON_WIDTH,
                            onTap: () {
                              seedModel.increase(SMALL_PURCHASE);
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
                          Text("Purchase $BIG_PURCHASE Seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            height: UI_SECONDARY_BUTTON_HEIGHT,
                            width: UI_SECONDARY_BUTTON_WIDTH,
                            onTap: () {
                              seedModel.increase(BIG_PURCHASE);
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
                                  child: Text(
                                      "Plant a Tree for $TREE_COST seeds",
                                      style: Flutter95.textStyle),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(UI_MARGIN),
                                  child: Button95(
                                    height: UI_PRIMARY_BUTTON_HEIGHT,
                                    width: UI_PRIMARY_BUTTON_WIDTH,
                                    child: Text("Plant"),
                                    onTap: () {
                                      if (seedModel.isEnoughSeed(TREE_COST)) {
                                        setState(() {
                                          errorText = "";
                                        });
                                        Alert95(
                                            context: context,
                                            title: 'PLANTED A TREE!',
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset('assets/tree.png',
                                                    width: 70),
                                                Container(
                                                  width: 160,
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text(
                                                      "You planted a beautiful tree! Your certificate will be sent to your email within a week.",
                                                      style:
                                                          Flutter95.textStyle),
                                                ),
                                              ],
                                            )).show();
                                        seedModel.decrease(TREE_COST);
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
