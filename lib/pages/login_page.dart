import 'package:earthsweeper/providers/login_page_provider.dart';
import 'package:earthsweeper/widgets/windows95/flutter95.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "Login",
      body: ChangeNotifierProvider<LoginPageProvider>(
        create: (c) => LoginPageProvider(c),
        builder: (c, v){
          return Scaffold95(
            title: "Login",
            body: Container(

            )
          );
        }
      ),
    );
  }
}
