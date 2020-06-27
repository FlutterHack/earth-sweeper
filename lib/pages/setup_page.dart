import 'package:flutter/material.dart';

import '../widgets/windows95/flutter95.dart';
import '../widgets/windows95/flutter95.dart';
import '../widgets/windows95/flutter95.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold95(
        title: 'Game Setup',
        body: Container(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {0: FractionColumnWidth(.5)},
                  children: [
                    TableRow(children: [
                      Container(),
                      Text(
                        "Height",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "Width",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "Mines",
                        style: Flutter95.textStyle,
                      )
                    ]),
                    TableRow(children: [
                      Material(
                        color: Colors.transparent,
                        child: RadioListTile(
                            activeColor: Colors.black,
                            title: Text(
                              "Beginner",
                              style: Flutter95.textStyle,
                            ),
                            value: 0,
                            groupValue: _selected,
                            onChanged: (int val) {
                              setState(() {
                                _selected = val;
                              });
                            }),
                      ),
                      Text(
                        "9",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "9",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "10",
                        style: Flutter95.textStyle,
                      )
                    ]),
                    TableRow(children: [
                      Material(
                        color: Colors.transparent,
                        child: RadioListTile(
                            title: Text(
                              "Intermediate",
                              style: Flutter95.textStyle,
                            ),
                            value: 1,
                            groupValue: _selected,
                            onChanged: (int val) {
                              setState(() {
                                _selected = val;
                              });
                            }),
                      ),
                      Text(
                        "16",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "16",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "40",
                        style: Flutter95.textStyle,
                      )
                    ]),
                    TableRow(children: [
                      Material(
                        color: Colors.transparent,
                        child: RadioListTile(
                            title: Text(
                              "Expert",
                              style: Flutter95.textStyle,
                            ),
                            value: 2,
                            groupValue: _selected,
                            onChanged: (int val) {
                              setState(() {
                                _selected = val;
                              });
                            }),
                      ),
                      Text(
                        "30",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "16",
                        style: Flutter95.textStyle,
                      ),
                      Text(
                        "99",
                        style: Flutter95.textStyle,
                      )
                    ]),
                    TableRow(children: [
                      Material(
                        color: Colors.transparent,
                        child: RadioListTile(
                            title: Text(
                              "Custom",
                              style: Flutter95.textStyle,
                            ),
                            value: 3,
                            groupValue: _selected,
                            onChanged: (int val) {
                              setState(() {
                                _selected = val;
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextField95(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextField95(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextField95(),
                      ),
                    ]),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Button95(
                    child: Text("Save"),
                    onTap: () {
                      print("Button clicked");
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
