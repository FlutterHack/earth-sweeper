import 'package:earthsweeper/pages/login_page.dart';
import 'package:earthsweeper/pages/seed_page.dart';
import 'package:earthsweeper/pages/setup_page.dart';
import 'package:earthsweeper/widgets/windows95/src/alert95.dart';
import 'package:earthsweeper/widgets/windows95/src/button95.dart';
import 'package:flutter/material.dart';

import 'widgets/windows95/flutter95.dart';
import 'widgets/windows95/src/menu95.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: "MSSansSerif"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold95(
        title: 'EarthSweeper',
        toolbar: Toolbar95(
          actions: [
            Item95(
              label: 'Game',
              menu: Menu95(
                  onItemSelected: (val) {
                    switch (val) {
                      case 5:
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SetupPage()));
                        break;
                    }
                  },
                  items: [
                    MenuItem95(
                      value: 1,
                      label: 'Beginner',
                    ),
                    MenuItem95(
                      value: 2,
                      label: 'Medium',
                    ),
                    MenuItem95(
                      value: 3,
                      label: 'Expert',
                    ),
                    MenuItem95(
                      value: 4,
                      label: 'Custom',
                    ),
                    MenuItem95(
                      value: 5,
                      label: 'Change Difficulty',
                    ),
                  ]),
            ),
            Item95(
              label: 'Seeds',
              menu: Menu95(
                items: [
                  MenuItem95(
                    value: 1,
                    label: 'Get Seeds',
                  ),
                  MenuItem95(
                    value: 2,
                    label: 'Plant Tree',
                  ),
                ],
                onItemSelected: (val) {
                  switch (val) {
                    case 1:
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SeedPage()));
                      break;
                  }
                },
              ),
            ),
          ],
        ),
        body: LoginPage(),
      ),
    );
  }
}
