import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/providers/game_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/windows95/flutter95.dart';

class SetupPage extends StatefulWidget {
  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int _selected = 0;
  String errorText = "";
  TextEditingController heightController;
  TextEditingController minesController;
  TextEditingController widthController;

  @override
  void initState() {
    super.initState();
    _selected =
        Provider.of<GameSettingsProvider>(context, listen: false).type.index;
    heightController = TextEditingController(
        text: Provider.of<GameSettingsProvider>(context, listen: false)
            .height
            .toString());
    widthController = TextEditingController(
        text: Provider.of<GameSettingsProvider>(context, listen: false)
            .width
            .toString());
    minesController = TextEditingController(
        text: Provider.of<GameSettingsProvider>(context, listen: false)
            .mines
            .toString());
  }

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
                                Provider.of<GameSettingsProvider>(context,
                                        listen: false)
                                    .changeSettings(
                                        GameType.beginner, 9, 9, 10);
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
                            activeColor: Colors.black,
                            title: Text(
                              "Intermediate",
                              style: Flutter95.textStyle,
                            ),
                            value: 1,
                            groupValue: _selected,
                            onChanged: (int val) {
                              setState(() {
                                _selected = val;
                                Provider.of<GameSettingsProvider>(context,
                                        listen: false)
                                    .changeSettings(
                                        GameType.intermediate, 16, 16, 40);
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
                            activeColor: Colors.black,
                            title: Text(
                              "Expert",
                              style: Flutter95.textStyle,
                            ),
                            value: 2,
                            groupValue: _selected,
                            onChanged: (int val) {
                              setState(() {
                                _selected = val;
                                Provider.of<GameSettingsProvider>(context,
                                        listen: false)
                                    .changeSettings(
                                        GameType.expert, 16, 30, 90);
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
                            activeColor: Colors.black,
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
                        child: TextField95(
                          controller: heightController,
                          inputType: TextInputType.number,
                          maxLength: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextField95(
                          controller: widthController,
                          inputType: TextInputType.number,
                          maxLength: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: TextField95(
                          controller: minesController,
                          inputType: TextInputType.number,
                          maxLength: 3,
                        ),
                      ),
                    ]),
                  ],
                ),
                if (errorText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      errorText,
                      style: Flutter95.textStyle,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Button95(
                    child: Text("Save"),
                    onTap: () {
                      var type, width, height, mines;
                      if (_selected == 3 &&
                          (widthController.text.isEmpty ||
                              heightController.text.isEmpty ||
                              minesController.text.isEmpty)) {
                        setState(() {
                          errorText = "Custom inputs cannot be empty!";
                        });
                        return;
                      }
                      switch (_selected) {
                        case 0:
                          type = GameType.beginner;
                          width = 9;
                          height = 9;
                          mines = 10;
                          break;
                        case 1:
                          type = GameType.intermediate;
                          width = 12;
                          height = 25;
                          mines = 60;
                          break;
                        case 2:
                          type = GameType.expert;
                          width = 16;
                          height = 30;
                          mines = 99;
                          break;
                        case 3:
                          type = GameType.custom;
                          width = int.tryParse(widthController.text);
                          height = int.tryParse(heightController.text);
                          mines = int.tryParse(minesController.text);
                          break;
                      }
                      if (_selected == 3 &&
                          (width == null || height == null || mines == null)) {
                        setState(() {
                          errorText = "Something wrong with the inputs!";
                        });
                        return;
                      } else {
                        setState(() {
                          errorText = "";
                        });
                      }

                      Provider.of<GameSettingsProvider>(context, listen: false)
                          .changeSettings(type, width, height, mines);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
