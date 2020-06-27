import 'package:earthsweeper/pages/login_page.dart';
import 'package:earthsweeper/pages/setup_page.dart';
import 'package:earthsweeper/widgets/appbar.dart';
import 'package:earthsweeper/widgets/windows95/src/alert95.dart';
import 'package:earthsweeper/widgets/windows95/src/button95.dart';
import 'package:flutter/material.dart';

import 'widgets/windows95/flutter95.dart';

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
  int _counter = 0;

  void _incrementCounter(BuildContext context) {
    Alert95(context: context, buttons: [
      Button95(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Text("CLOSE"),
      )
    ]).show();

    setState(() {
      _counter++;
    });
  }

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
                      case 4:
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
                  ]),
            ),
            Item95(
              label: 'Get Seeds',
              onTap: (_) {},
            ),
            Item95(
              label: 'Plant a Tree',
              onTap: (_) {},
            ),
          ],
        ),
        body: LoginPage(),
      ),
    );
  }
}
