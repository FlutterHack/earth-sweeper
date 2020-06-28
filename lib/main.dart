import 'package:earthsweeper/constants/win95_page_transition.dart';
import 'package:earthsweeper/models/game.dart';
import 'package:earthsweeper/pages/login_page.dart';
import 'package:earthsweeper/pages/seed_page.dart';
import 'package:earthsweeper/pages/setup_page.dart';
import 'package:earthsweeper/providers/game_settings_provider.dart';
import 'package:earthsweeper/providers/seed_provider.dart';
import 'package:earthsweeper/widgets/windows95/src/alert95.dart';
import 'package:earthsweeper/widgets/windows95/src/button95.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'widgets/windows95/flutter95.dart';
import 'widgets/windows95/src/menu95.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set system related stuff for best gaming
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GameSettingsProvider()),
        ChangeNotifierProvider(create: (_) => SeedProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: "MSSansSerif"),
        home: MyHomePage(title: 'Earth-Sweeper'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int gameType;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<GameSettingsProvider>(
        child: LoginPage(),
        builder: (context, model, child) => Scaffold95(
          title: 'Earth Sweeper',
          toolbar: Toolbar95(
            actions: [
              Item95(
                label: 'Game',
                menu: Menu95(
                    onItemSelected: (val) {
                      switch (val) {
                        case 0:
                          model.changeSettings(GameType.beginner, 9, 9, 10);
                          break;
                        case 1:
                          model.changeSettings(GameType.intermediate, 16, 16, 40);
                          break;
                        case 2:
                          model.changeSettings(GameType.expert, 30, 16, 990);

                          break;
                        case 3:
                          Navigator.of(context)
                              .push(Win95Transition(widget: SetupPage()));

                          break;
                      }
                    },
                    items: [
                      MenuItem95(
                        value: 0,
                        label: 'Beginner' +
                            (model.settings.type.index == 0 ? ' ✓' : ''),
                      ),
                      MenuItem95(
                        value: 1,
                        label: 'Medium' +
                            (model.settings.type.index == 1 ? ' ✓' : ''),
                      ),
                      MenuItem95(
                        value: 2,
                        label: 'Expert' +
                            (model.settings.type.index == 2 ? ' ✓' : ''),
                      ),
                      MenuItem95(
                        value: 3,
                        label: 'Custom' +
                            (model.settings.type.index == 3 ? ' ✓' : ''),
                      ),
                    ]),
              ),
              Item95(
                label: 'Seeds',
                onTap: (_) {
                  Navigator.of(context)
                      .push(Win95Transition(widget: SeedPage()));
                },
                // menu: Menu95(
                //   items: [
                //     MenuItem95(
                //       value: 1,
                //       label: 'Get Seeds',
                //     ),
                //     MenuItem95(
                //       value: 2,
                //       label: 'Plant Tree',
                //     ),
                //   ],
                //   onItemSelected: (val) {
                //     switch (val) {
                //       case 1:
                //         Navigator.of(context).push(MaterialPageRoute(
                //             builder: (context) => SeedPage()));
                //         break;
                //     }
                //   },
                // ),
              ),
            ],
          ),
          body: child,
        ),
      ),
    );
  }
}
