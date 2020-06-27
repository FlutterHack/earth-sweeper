import 'package:earthsweeper/widgets/windows95/src/toolbar95.dart';
import 'package:earthsweeper/widgets/windows95/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'button95.dart';
import 'globals.dart';

class Scaffold95 extends StatelessWidget {
  const Scaffold95({
    @required this.title,
    @required this.body,
    this.toolbar,
    Key key,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Toolbar95 toolbar;

  @override
  Widget build(BuildContext context) {
    return Elevation95(
      child: Column(
        children: <Widget>[
          WindowHeader95(title: title),
          const SizedBox(height: 4),
          if (toolbar != null) toolbar,
          if (toolbar != null) const SizedBox(height: 4),
          body,
        ],
      ),
    );
  }
}

class WindowHeader95 extends StatefulWidget {
  const WindowHeader95({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  _WindowHeader95State createState() => _WindowHeader95State();
}

class _WindowHeader95State extends State<WindowHeader95> {
  bool _canPop;

  @override
  void didChangeDependencies() {
    _canPop = Navigator.of(context).canPop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Flutter95.headerDark,
            Flutter95.headerLight,
          ],
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: Flutter95.headerTextStyle,
          ),
          Spacer(),
          if (_canPop) CloseButton95(),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}

class CloseButton95 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button95(
      height: 24,
      padding: EdgeInsets.zero,
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.close,
        size: 20,
      ),
    );
  }
}
