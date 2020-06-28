import 'package:flutter/material.dart';

import '../widgets/windows95/flutter95.dart';
import '../widgets/windows95/flutter95.dart';
import '../widgets/windows95/flutter95.dart';

class SeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold95(
            title: 'Seeds',
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("42 Seeds", style: Flutter95.textStyle),
                          Image.asset(
                            'assets/seed.png',
                            width: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Watch Ad to earn 100 Seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            onTap: () {},
                            child: Text("Watch"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Purchase 500 seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            onTap: () {},
                            child: Text("\$ 1"),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Purchase 1500 Seeds",
                              style: Flutter95.textStyle),
                          Button95(
                            onTap: () {},
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
                        margin: const EdgeInsets.all(8.0),
                        child: Elevation95(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/tree.png',
                                  height: 200,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Plant a Tree for 2000 seeds",
                                      style: Flutter95.textStyle),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Button95(
                                    child: Text("Plant"),
                                    onTap: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            )));
  }
}
