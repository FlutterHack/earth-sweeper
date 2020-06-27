import 'package:earthsweeper/providers/login_page_provider.dart';
import 'package:earthsweeper/widgets/windows95/flutter95.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/windows95/flutter95.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'You can plant a tree by playing Earth Sweeper',
              style: Flutter95.textStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/tree.png',
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button95(
                child: Text("Play"),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
