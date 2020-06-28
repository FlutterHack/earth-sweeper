import 'package:flutter/material.dart';

class Win95Transition extends PageRouteBuilder {
  final Widget widget;

  Win95Transition({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, secAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return ScaleTransition(
                alignment: Alignment.bottomLeft,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secAnimation) => widget);
}
